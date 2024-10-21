#version 460 core

uniform vec3 u_color;
uniform float u_intensity;
uniform int u_visualizeMode;

in vec2 TexCoord;
in vec3 Normal;

out vec4 FragColor;

void main() {
    if (u_visualizeMode == 0) {
        // Show texture coordinates
        FragColor = vec4(TexCoord, 0.0, 1.0);
    } else {
        // Show normals (scaled to [0,1] range for visualization)
        vec3 norm = normalize(Normal) * 0.5 + 0.5;
        FragColor = vec4(norm, 1.0);
    }
}