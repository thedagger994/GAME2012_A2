#version 460 core

// Position attribute is now a vec2 (see glVertexAttribPointer parameters)
layout (location = 0) in vec2 aPosition;

out vec3 color;
uniform float u_a;

// No need to transform our lines, although it might make your assignment easier if you render the same square with different transformations!
//uniform mat4 u_mvp;

void main()
{
   //vec4 position = u_mvp * vec4(aPosition, 1.0);
   //color = vec3(aPosition * 0.5 + 0.5, u_a);
   //gl_Position = vec4(aPosition, 0.0, 1.0);

   // Calculate square index based on vertex ID
    int squareIndex = gl_VertexID / 4;

    // Generate a unique color for each square
    vec3 baseColor = vec3(
        float(squareIndex & 1),
        float((squareIndex >> 1) & 1),
        float((squareIndex >> 2) & 1)
    );

    // Create a dynamic color based on position and time
    vec3 dynamicColor = vec3(
        sin(aPosition.x * 3.14 + u_a * 2.0),
        cos(aPosition.y * 3.14 + u_a * 3.0),
        sin((aPosition.x + aPosition.y) * 3.14 + u_a * 4.0)
    ) * 0.5 + 0.5;

    // Combine base color and dynamic color
    color = mix(baseColor, dynamicColor, u_a);

    gl_Position = vec4(aPosition, 0.0, 1.0);
}