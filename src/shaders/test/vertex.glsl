uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;

attribute vec3 position;
attribute float aRandom;

// how to use varying to send data to fragment shader file.
// varying float vRandom;

void main()
{
    // scrivendo gl_Position in questo modo ci da più controllo
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);
    // modelPosition.z += sin(modelPosition.x * 10.0) * 0.1; // per esempio creare onde sin sull'asse z.
    //modelPosition.z += aRandom * 0.1; // qui prendiamo il nostro attribute che abbiamo creato e li collochiamo sull'asse z.

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;

    gl_Position = projectedPosition;

    // vRandom = aRandom;
    // ==
    // gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);
}