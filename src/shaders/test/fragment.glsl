precision mediump float;

// varying float vRandom;

uniform vec3 uColor;
uniform sampler2D uTxture;

varying vec2 vUv;

void main()
{
    vec4 textureColor = texture2D(uTxture, vUv);
    gl_FragColor = textureColor;
}