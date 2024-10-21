#version 460 core

uniform int u_visualizeMode;

in vec2 TexCoord;
in vec3 Normal;

out vec4 FragColor;

void main() {
    vec3 norm = normalize(Normal) * 0.5 + 0.5;
    
    if (u_visualizeMode == 0) {
        FragColor = vec4(TexCoord, 0.0, 1.0);
    } else {
        FragColor = vec4(norm, 1.0);
    }
}