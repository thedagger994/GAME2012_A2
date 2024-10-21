#version 460 core

layout (location = 0) in vec2 aPos;

uniform float u_a;

void main() {
    gl_Position = vec4(aPos * u_a, 0.0, 1.0);
}