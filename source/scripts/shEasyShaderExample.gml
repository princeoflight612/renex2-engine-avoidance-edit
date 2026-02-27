/*
    shEasyShaderExample
*/

return shader_pixel_create_base64("
    eJxVkTFoFEEUhr83uwcHUQYUrAQXQdAUB3eisAjGXAoVTkSTA0lzXOJqFrxcuFsx
    6Ra0iGBxhZVYTNrd5hq1EbG1s7JJe7W9TUZmd+80DAPv/97733vDiLL2xN5kbWO1
    fRE4AkRZ6wFOI/ABeAI4Jih2HAf2AUUN4QJvKva+YD7CuQXrPR/02v1xtBHtJy9H
    ET5nkOJU+Xg3iXbHcXJA7qacyiXxIGJv3Gv1tngQb4+G4+GzJLj6+Fpwr7PeCdZ3
    +k+jUbA2HOzFL6JREDZaYSO80Wpcbzab5PkjqIE24a+Hq51XH9uu57vfy3cdF7R5
    /efybWDlWP+4c6zvf3dcoY2c/fmpv/T5S54t33p7eBg67qFNnmVfgW+QrjjfJfdc
    SMGb/ov1pIon1LWRIpYUutMyVqkPZhP8ks/cNZAZf8FIBYzQNecXfpzvv3xmBGuu
    gC+ogilmxmNmasV3SSp0U7CneqgqV/boHs1rna4VM8sd3T5lrTffcdoutC51fT6n
    0swmhbdeamvhLy74dV8=
")

/*
    // A sample PShader for use with objPShaderEffect, objPShaderChain and objPShaderRectangle.
    // The Fragment Shader has two uniforms: time and intensity

    // time: time in seconds (increments by 1/50 every frame)
    // intensity: a variable between 0 and 1 determining the intensity (or some other arbitrary parameter) of a shader effect
    varying vec2 v_vTexcoord;
    varying vec4 v_vColour;
    uniform float time;
    uniform float intensity;

    float rand(vec2 co){
        return fract(sin(dot(co, vec2(12.9898, 78.233))) * 43758.5453);
    }

    void main()
    {
        gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord + intensity*vec2(rand(vec2(v_vTexcoord.y,time))-0.5,0.0));
    }


*/
