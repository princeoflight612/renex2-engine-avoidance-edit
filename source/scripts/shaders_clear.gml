/// shaders_clear();
/**
    * Clears all shader effects currently active.
*/

with(objPShaderChain) instance_destroy();
with(objPShaderEffect) instance_destroy();
with(objPShaderChainElement) instance_destroy();
