// Alloy Physical Shader Framework
// Copyright 2013-2016 RUST LLC.
// http://www.alloy.rustltd.com/

/////////////////////////////////////////////////////////////////////////////////
/// @file DirectionalBlend.cginc
/// @brief Directional Blend shader definition.
/////////////////////////////////////////////////////////////////////////////////

#ifndef A_DEFINITIONS_DIRECTIONAL_BLEND_CGINC
#define A_DEFINITIONS_DIRECTIONAL_BLEND_CGINC

#define A_MAIN_TEXTURES_ON
#define A_MAIN_TEXTURES_CUTOUT_OFF
#define A_DIRECTIONAL_BLEND_ON
#define A_SECONDARY_TEXTURES_ON

#include "Assets/Alloy/Shaders/Lighting/Standard.cginc"
#include "Assets/Alloy/Shaders/Models/Standard.cginc"
    
void aSurface(
    inout ASurface s)
{
    aParallax(s);
    aDissolve(s);
    aMainTextures(s);
    aDetail(s);
    aTeamColor(s);
    aDecal(s);
    aEmission(s);
    aDirectionalBlend(s);
    aSecondaryTextures(s);
    aCutout(s);

    aNoBlend(s);
    aUpdateNormalData(s);
    aAo2(s);
    aRim(s);
}

#endif // A_DEFINITIONS_DIRECTIONAL_BLEND_CGINC
