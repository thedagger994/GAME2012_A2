#version 460 core

in vec2 TexCoord;
in vec3 Normal;

out vec4 FragColor;

uniform vec3 u_color;
uniform float u_intensity;
uniform int u_visualizeMode;

void main() {
    if (u_visualizeMode == 0) {
        FragColor = vec4(TexCoord, 0.0, 1.0);
    } else if (u_visualizeMode == 1) {
        FragColor = vec4(normalize(Normal) * 0.5 + 0.5, 1.0);
    } else {
        FragColor = vec4(u_color * u_intensity, 1.0);
    }
}