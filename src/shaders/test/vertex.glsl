uniform mat4 projectionMatrix;
uniform mat4 viewMatrix;
uniform mat4 modelMatrix;
uniform vec2 uFrequency; // creando il nostro uniform possiamo cambiare data dal nostro js file.
uniform float uTime;

attribute vec3 position;
attribute float aRandom;

// how to use varying to send data to fragment shader file.
// varying float vRandom;

void main()
{
    // scrivendo gl_Position in questo modo ci da più controllo
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);
    // per esempio creare onde sin sull'asse
    modelPosition.z += sin(modelPosition.x * uFrequency.x - uTime) * 0.1; 
    modelPosition.z += sin(modelPosition.y * uFrequency.y - uTime) * 0.1; 
    //modelPosition.z += aRandom * 0.1; // qui prendiamo il nostro attribute che abbiamo creato e li collochiamo sull'asse z.

    

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectedPosition = projectionMatrix * viewPosition;

    gl_Position = projectedPosition;

    // vRandom = aRandom;
    // ==
    // gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0);
}