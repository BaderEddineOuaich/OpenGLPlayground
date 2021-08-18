#include "pch.hpp"
#include "Application.hpp"
#include <Utility/OpenGLUtils.hpp>
#include <UI/ImGuiRenderer.hpp>
#include <Scenes/MainMenuScene/MainMenuScene.hpp>
#include <Event/EventDispatcher.hpp>
#include <Event/ApplicationEvent.hpp>
#include <Event/ApplicationEvent.hpp>


Application::Application()
	:
	m_window(new Window("OpenGL Play Ground", 800, 600))
{
	// Make singleton
	if (m_instance)
		throw std::runtime_error("Application instance was already created");
	m_instance = this;

	// Init ImGui Renderer
	m_imgui_renderer = std::make_unique<ImGuiRenderer>();

	// Listen to Window Events callback
	m_window->SetEventCallback(BIND_FUN(Application::OnEvent));

	// Push Main Menu Scene as the initial scene
	PushScene(std::make_unique<MainMenuScene>());
}

void Application::PushScene(std::unique_ptr<Scene> scene)
{
	//=== Scene::OnCreate ===//
	m_scenes.emplace_back(std::move(scene))->OnCreate();
	//m_scenes.back()->OnCreate();
}

void Application::UpdateDeltaTime() noexcept
{
	m_current_frame_time = static_cast<float>(glfwGetTime());
	m_delta_time = m_current_frame_time - m_last_frame_time;
	m_last_frame_time = m_current_frame_time;
}

void Application::UpdateFPS() noexcept
{
	m_FPS++;
	m_FPS_timer += m_delta_time;
	if (m_FPS_timer >= 1.0f)
	{
		m_window->SetTitle(m_window->GetTitle(), m_FPS);
		m_FPS = 0;
		m_FPS_timer = 0.0f;
	}
}


void Application::OnEvent(Event& event)
{
	// Listen for WindowClose, WindowResize and FrameBufferResizeEvent Events
	EventDispatcher dispatcher(event);
	/*dispatcher.Dispatch<WindowCloseEvent>([this](WindowCloseEvent& e) -> bool
	{
	});*/
	dispatcher.Dispatch<WindowCloseEvent>(BIND_FUN(Application::OnWindowClose));
	dispatcher.Dispatch<WindowResizeEvent>(BIND_FUN(Application::OnWindowResize));
	dispatcher.Dispatch<FrameBufferResizeEvent>(BIND_FUN(Application::OnFrameBufferResize));


	//=== Scene::OnEvent ===//
	// Alert All Scenes OnEvent
	for (auto it = m_scenes.rbegin(); it != m_scenes.rend(); ++it)
	{
		// Alert each scene with the triggered event
		(*it)->OnEvent(event);

		// if event is handled by a scene, stop passing it to other scenes
		if (event.IsHandled())
			break;
	}
}

bool Application::OnWindowClose(WindowCloseEvent& /*event*/)
{
	/*
		if(we shouldn't close yet, there is still some work running...)
				this->m_window->SetShouldClose(false);
	*/
	this->m_window->SetShouldClose(true);
	return true; // the end of the app, all events are handled.
}

bool Application::OnWindowResize(WindowResizeEvent& event)
{
	// Update OpenGL Viewport
	glAssert(glViewport(0, 0, event.GetWidth(), event.GetHeight()));
	return false;
}



bool Application::OnFrameBufferResize(FrameBufferResizeEvent& event)
{
	// Update OpenGL Viewport
	glAssert(glViewport(0, 0, event.GetWidth(), event.GetHeight()));
	return false;
}


void Application::Run()
{
	while (!m_window->ShouldClose())
	{
		// Poll Events
		m_window->PollEvents();

		// Update & Draw (only if there are scenes, otherwise end app).
		if (!m_scenes.empty())
		{
			//=== Scene::OnUpdate ===//
			{
				// Delta time
				UpdateDeltaTime();
				// FPS
				UpdateFPS();
				// Update back scene (last pushed scene which is the active one)
				m_scenes.back()->OnUpdate(m_delta_time);
			}

			//=== Scene::OnDraw ===//
			{
				// Draw back scene (last pushed scene which is the active one)
				m_scenes.back()->OnDraw();

				//=== Scene::OnImGuiDraw ===//
				// ImGui Draw (over opengl draws)
				m_imgui_renderer->Begin();
					m_scenes.back()->OnImGuiDraw();
				m_imgui_renderer->End();

				// Force execution of GL commands in finite time 
				glAssert(glFlush());
			}

			// Swap Buffers
			m_window->SwapBuffers();

			// Check if the current active scene wants to quit (scene must call Scene::Exit to be destroyed)
			if (m_scenes.back()->WantsToExit())
			{
				//=== Scene::OnDestroy ===//
				// Notify user OnDestroy before ending scene
				m_scenes.back()->OnDestroy();
				// Destroy Scene
				m_scenes.pop_back(); // Remove scene from vector (btw vector will call ~unique_ptr to cleanup memory for us)
			}

		}
		else // No scenes ? End App.
		{
			m_window->SetShouldClose(true);
		}
	}
}



Application::~Application()
{
	//=== Scene::OnDestroy() ===//
	std::for_each(m_scenes.rbegin(), m_scenes.rend(), [](const std::unique_ptr<Scene>& scene)
	{
		scene->OnDestroy();
	});
	m_scenes.clear();
}