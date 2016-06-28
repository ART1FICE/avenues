// Alloy Physical Shader Framework
// Copyright 2013-2016 RUST LLC.
// http://www.alloy.rustltd.com/

Shader "Alloy/Legacy/Human/Skin" {
Properties {
    _Lightmapping ("'GI' {LightmapEmissionProperty:{}}", Float) = 1
    
    // Main Textures
    _MainTextures ("'Skin Textures' {Section:{126, 41, 41}}", Float) = 0
    [LM_Albedo] [LM_Transparency] 
    _Color ("'Tint' {}", Color) = (1,1,1,1)	
    [LM_MasterTilingOffset] [LM_Albedo] 
    _MainTex ("'Base Color(RGB) Trans(A)' {Visualize:{RGB, A}}", 2D) = "white" {}
    _MainTexVelocity ("Scroll", Vector) = (0,0,0,0) 
    _MainTexUV ("UV Set", Float) = 0
    [LM_Metallic]
    _SpecTex ("'Skin(R) AO(G) Spec(B) Rough(A)' {Visualize:{R, G, B, A}, Parent:_MainTex}", 2D) = "white" {}
    [LM_NormalMap]
    _BumpMap ("'Normals' {Visualize:{NRM}, Parent:_MainTex}", 2D) = "bump" {}
    _BaseColorVertexTint ("'Vertex Color Tint' {Min:0, Max:1}", Float) = 0
     
    // Main Physical Properties
    _MainPhysicalProperties ("'Main Physical Properties' {Section:{126, 66, 41}}", Float) = 0
    _Specularity ("'Specularity' {Min:0, Max:1}", Float) = 1
    _Roughness ("'Roughness' {Min:0, Max:1}", Float) = 1
    _Occlusion ("'Occlusion Strength' {Min:0, Max:1}", Float) = 1
    _BumpScale ("'Normal Strength' {}", Float) = 1
    
    // Scattering Properties
    _ScatteringProperties ("'Scattering' {Section:{126, 92, 41}}", Float) = 0
    _SssBrdfTex ("'LUT' {Controls:False}", 2D) = "gray" {}
    _SssBias ("'Bias' {Min:0, Max:1}", Float) = 0
    _SssScale ("'Scale' {Min:0, Max:1}", Float) = 1
    _SssAoSaturation ("'AO Saturation' {Min:0, Max:1}", Float) = 0.5
    _SssBumpBlur ("'Bump Blur' {Min:0, Max:1}", Float) = 0
    
    // Transmission Properties
    _TransmissionProperties ("'Transmission' {Section:{126, 118, 41}}", Float) = 0
    _TransColor ("'Tint' {}", Color) = (1,1,1)
    [Gamma]
    _TransScale ("'Weight' {Min:0, Max:1}", Float) = 1
    _TransPower ("'Falloff' {Min:1}", Float) = 1
    _TransDistortion ("'Bump Distortion' {Min:0, Max:1}", Float) = 0.1
    
    // Detail Properties
    [Toggle(_DETAIL_ON)] 
    _DetailT ("'Detail' {Feature:{57, 126, 41}}", Float) = 0
    _DetailMask ("'Mask(A)' {Visualize:{A}, Parent:_MainTex}", 2D) = "white" {}
    [Enum(Mul, 0, MulX2, 1)] 
    _DetailMode ("'Color Mode' {Dropdown:{Mul:{}, MulX2:{}}}", Float) = 0
    _DetailAlbedoMap ("'Color(RGB)' {Visualize:{RGB}}", 2D) = "white" {}
    _DetailAlbedoMapVelocity ("Scroll", Vector) = (0,0,0,0) 
    _DetailAlbedoMapUV ("UV Set", Float) = 0
    _DetailMaterialMap ("'AO(G) Variance(A)' {Visualize:{G, A}, Parent:_DetailAlbedoMap}", 2D) = "white" {}
    _DetailNormalMap ("'Normals' {Visualize:{NRM}, Parent:_DetailAlbedoMap}", 2D) = "bump" {}
    _DetailWeight ("'Weight' {Min:0, Max:1}", Float) = 1
    _DetailFalloff ("'Falloff' {Min:0.01}", Float) = 0.01
    _DetailOcclusion ("'Occlusion Strength' {Min:0, Max:1}", Float) = 1
    _DetailNormalMapScale ("'Normal Strength' {}", Float) = 1
    
    // Team Color Properties
    [Toggle(_TEAMCOLOR_ON)] 
    _TeamColor ("'Team Color' {Feature:{41, 126, 50}}", Float) = 0
    _TeamColorMaskMap ("'Masks(RGBA)' {Visualize:{R, G, B, A}, Parent:_MainTex}", 2D) = "black" {}
    _TeamColorMasksAsTint ("'Masks as Tint?' {Toggle:{On:{_TeamColorMasks, _TeamColor0, _TeamColor1, _TeamColor2, _TeamColor3}, Off:{}}}", Float) = 0
    _TeamColorMasks ("'Mask' {Vector:Mask}", Vector) = (1,1,1,0)
    _TeamColor0 ("'Tint R' {}", Color) = (1,0,0)
    _TeamColor1 ("'Tint G' {}", Color) = (0,1,0)
    _TeamColor2 ("'Tint B' {}", Color) = (0,0,1)
    _TeamColor3 ("'Tint A' {}", Color) = (0.5,0.5,0.5)
    
    // Decal Properties 
    [Toggle(_DECAL_ON)] 
    _Decal ("'Decal' {Feature:{41, 126, 75}}", Float) = 0	
    _DecalColor ("'Tint' {}", Color) = (1,1,1,1)
    _DecalTex ("'Base Color(RGB) Opacity(A)' {Visualize:{RGB, A}}", 2D) = "black" {} 
    _DecalTexUV ("UV Set", Float) = 0
    _DecalWeight ("'Weight' {Min:0, Max:1}", Float) = 1
    _DecalSpecularity ("'Specularity' {Min:0, Max:1}", Float) = 0.5
    _DecalAlphaVertexTint ("'Vertex Alpha Tint' {Min:0, Max:1}", Float) = 0

    // Emission Properties 
    [Toggle(_EMISSION)] 
    _Emission ("'Emission' {Feature:{41, 126, 101}}", Float) = 0
    [LM_Emission] 
    [HDR]
    _EmissionColor ("'Tint' {}", Color) = (1,1,1)
    [LM_Emission] 
    _EmissionMap ("'Mask(RGB)' {Visualize:{RGB}, Parent:_MainTex}", 2D) = "white" {}
    _IncandescenceMap ("'Effect(RGB)' {Visualize:{RGB}}", 2D) = "white" {} 
    _IncandescenceMapVelocity ("Scroll", Vector) = (0,0,0,0) 
    _IncandescenceMapUV ("UV Set", Float) = 0
    [Gamma]
    _EmissionWeight ("'Weight' {Min:0, Max:1}", Float) = 1

    // Rim Emission Properties 
    [Toggle(_RIM_ON)] 
    _Rim ("'Rim Emission' {Feature:{41, 125, 126}}", Float) = 0
    [HDR]
    _RimColor ("'Tint' {}", Color) = (1,1,1)
    _RimTex ("'Effect(RGB)' {Visualize:{RGB}}", 2D) = "white" {}
    _RimTexVelocity ("Scroll", Vector) = (0,0,0,0) 
    _RimTexUV ("UV Set", Float) = 0
    [Gamma]
    _RimWeight ("'Weight' {Min:0, Max:1}", Float) = 1
    [Gamma]
    _RimBias ("'Fill' {Min:0, Max:1}", Float) = 0
    _RimPower ("'Falloff' {Min:0.01}", Float) = 4

    // Dissolve Properties 
    [Toggle(_DISSOLVE_ON)] 
    _Dissolve ("'Dissolve' {Feature:{41, 100, 126}}", Float) = 0
    [HDR]
    _DissolveGlowColor ("'Glow Tint' {}", Color) = (1,1,1,1)
    _DissolveTex ("'Glow Color(RGB) Opacity(A)' {Visualize:{RGB, A}}", 2D) = "white" {} 
    _DissolveTexUV ("UV Set", Float) = 0
    _DissolveCutoff ("'Cutoff' {Min:0, Max:1}", Float) = 0
    [Gamma]
    _DissolveGlowWeight ("'Glow Weight' {Min:0, Max:1}", Float) = 1
    _DissolveEdgeWidth ("'Glow Width' {Min:0, Max:1}", Float) = 0.01
}

SubShader {
    Tags { 
        "Queue" = "Geometry" 
        "RenderType" = "Opaque"
    }
    LOD 400

    Pass {
        Name "FORWARD" 
        Tags { "LightMode" = "ForwardBase" }

        CGPROGRAM
        #pragma target 3.0
        #pragma exclude_renderers gles
        
        #pragma shader_feature _DETAIL_ON
        #pragma shader_feature _TEAMCOLOR_ON
        #pragma shader_feature _DECAL_ON
        #pragma shader_feature _EMISSION
        #pragma shader_feature _RIM_ON
        #pragma shader_feature _DISSOLVE_ON
        
        #pragma multi_compile_fwdbase
        #pragma multi_compile_fog
        //#pragma multi_compile_instancing
            
        #pragma vertex aVertexShader
        #pragma fragment aFragmentShader
        
        #define UNITY_PASS_FORWARDBASE
        
        #include "Assets/Alloy/Shaders/Definitions/Legacy/Skin.cginc"
        #include "Assets/Alloy/Shaders/Passes/ForwardBase.cginc"

        ENDCG
    }
    
    Pass {
        Name "FORWARD_DELTA"
        Tags { "LightMode" = "ForwardAdd" }
        
        Blend One One
        ZWrite Off

        CGPROGRAM
        #pragma target 3.0
        #pragma exclude_renderers gles
        
        #pragma shader_feature _DETAIL_ON
        #pragma shader_feature _TEAMCOLOR_ON
        #pragma shader_feature _DECAL_ON
        #pragma shader_feature _DISSOLVE_ON
        
        #pragma multi_compile_fwdadd_fullshadows
        #pragma multi_compile_fog
        //#pragma multi_compile_instancing
        
        #pragma vertex aVertexShader
        #pragma fragment aFragmentShader

        #define UNITY_PASS_FORWARDADD

        #include "Assets/Alloy/Shaders/Definitions/Legacy/Skin.cginc"
        #include "Assets/Alloy/Shaders/Passes/ForwardAdd.cginc"

        ENDCG
    }
    
    Pass {
        Name "SHADOWCASTER"
        Tags { "LightMode" = "ShadowCaster" }
        
        CGPROGRAM
        #pragma target 3.0
        #pragma exclude_renderers gles

        #pragma shader_feature _DISSOLVE_ON
        
        #pragma multi_compile_shadowcaster
        //#pragma multi_compile_instancing

        #pragma vertex aVertexShader
        #pragma fragment aFragmentShader
        
        #define UNITY_PASS_SHADOWCASTER
        
        #include "Assets/Alloy/Shaders/Definitions/Legacy/Skin.cginc"
        #include "Assets/Alloy/Shaders/Passes/Shadow.cginc"

        ENDCG
    }
    
    Pass {
        Name "Meta"
        Tags { "LightMode" = "Meta" }

        Cull Off

        CGPROGRAM
        #pragma target 3.0
        #pragma exclude_renderers nomrt gles
        
        #pragma shader_feature _DETAIL_ON
        #pragma shader_feature _TEAMCOLOR_ON
        #pragma shader_feature _DECAL_ON
        #pragma shader_feature _EMISSION
        
        #pragma vertex aVertexShader
        #pragma fragment aFragmentShader
        
        #define UNITY_PASS_META
        
        #include "Assets/Alloy/Shaders/Definitions/Legacy/Skin.cginc"
        #include "Assets/Alloy/Shaders/Passes/Meta.cginc"

        ENDCG
    }
}

FallBack "VertexLit"
CustomEditor "AlloyFieldBasedEditor"
}
