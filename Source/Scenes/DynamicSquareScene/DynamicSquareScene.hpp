#pragma once
#include "Scenes/Scene.hpp"
#include <Graphics/Shader/Shader.hpp>
#include <Graphics/Buffer/VertexBuffer/VertexBuffer.hpp>
#include <Graphics/Buffer/VertexArray/VertexArray.hpp>


class DynamicSquareScene : public Scene
{
public:
	DynamicSquareScene() = default;
	~DynamicSquareScene() = default;

public: /* Scene Life Cicle */
	void OnCreate() override;
	void OnEvent(Event& event) override;
	void OnUpdate(float dt)  override;
	void OnDraw()  override;
	void OnImGuiDraw()  override;
	void OnDestroy()  override;
	

private:
	std::shared_ptr<VertexBuffer> m_vertex_buffer; // < Square's vertex buffer, will hold vertices
	std::shared_ptr<VertexArray> m_vertex_array; // < Square's vertex array, will hold vertex buffers, and index buffer
	std::shared_ptr<Shader> m_shader; // < Square's shader

	// 4 Vertices (4 points) to draw a square (See OpenGL Tutorials/Square Vertices.png)
	std::array<float, 12> SQUARE_VERTICES
	{
		/* Vertex 1 xyz */ -0.5F, 0.5f, 0.0f,  // center top left 0
		/* Vertex 2 xyz */ 0.5f, 0.5f,  0.0f,   // center top right 1
		/* Vertex 3 xyz */ -0.5f, -0.5f, 0.0f, // center bottom left 2
		/* Vertex 4 xyz */ 0.5f, -0.5f, 0.0f,  // center bottom right 3
	};

	// We can draw the square as two triangles with index buffer, from V1, V3, V4, and from V1, V2, V4
	static constexpr std::array<std::uint32_t, 6> SQUARE_INDICES
	{
		0, 2, 3, // first triangle
		0, 1, 3 // second triangle
	};
};
