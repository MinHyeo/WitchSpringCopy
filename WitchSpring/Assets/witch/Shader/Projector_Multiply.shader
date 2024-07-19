//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Projector/Multiply" {
Properties {
_ShadowTex ("Cookie", 2D) = "gray" { }
_FalloffTex ("FallOff", 2D) = "white" { }
}
SubShader {
 Tags { "QUEUE" = "Transparent" }
 Pass {
  Tags { "QUEUE" = "Transparent" }
  Blend DstColor Zero, DstColor Zero
  ColorMask RGB 0
  ZWrite Off
  Offset -1, -1
  GpuProgramID 6280
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_Projector[4];
uniform 	vec4 hlslcc_mtx4x4unity_ProjectorClip[4];
attribute highp vec4 in_POSITION0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_Projector[1];
    u_xlat0 = hlslcc_mtx4x4unity_Projector[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_Projector[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_Projector[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ProjectorClip[1];
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ProjectorClip[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform lowp sampler2D _ShadowTex;
uniform lowp sampler2D _FalloffTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat10_0 = texture2D(_FalloffTex, u_xlat0.xy).w;
    u_xlat3.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_1 = texture2D(_ShadowTex, u_xlat3.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.w = (-u_xlat10_1.w) + 1.0;
    SV_Target0 = vec4(u_xlat10_0) * u_xlat16_2 + vec4(1.0, 1.0, 1.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_Projector[4];
uniform 	vec4 hlslcc_mtx4x4unity_ProjectorClip[4];
attribute highp vec4 in_POSITION0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_Projector[1];
    u_xlat0 = hlslcc_mtx4x4unity_Projector[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_Projector[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_Projector[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ProjectorClip[1];
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ProjectorClip[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform lowp sampler2D _ShadowTex;
uniform lowp sampler2D _FalloffTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat10_0 = texture2D(_FalloffTex, u_xlat0.xy).w;
    u_xlat3.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_1 = texture2D(_ShadowTex, u_xlat3.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.w = (-u_xlat10_1.w) + 1.0;
    SV_Target0 = vec4(u_xlat10_0) * u_xlat16_2 + vec4(1.0, 1.0, 1.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_Projector[4];
uniform 	vec4 hlslcc_mtx4x4unity_ProjectorClip[4];
attribute highp vec4 in_POSITION0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_Projector[1];
    u_xlat0 = hlslcc_mtx4x4unity_Projector[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_Projector[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_Projector[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ProjectorClip[1];
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ProjectorClip[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform lowp sampler2D _ShadowTex;
uniform lowp sampler2D _FalloffTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp float u_xlat10_0;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat10_0 = texture2D(_FalloffTex, u_xlat0.xy).w;
    u_xlat3.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_1 = texture2D(_ShadowTex, u_xlat3.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.w = (-u_xlat10_1.w) + 1.0;
    SV_Target0 = vec4(u_xlat10_0) * u_xlat16_2 + vec4(1.0, 1.0, 1.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_Projector[4];
uniform 	vec4 hlslcc_mtx4x4unity_ProjectorClip[4];
in highp vec4 in_POSITION0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_Projector[1];
    u_xlat0 = hlslcc_mtx4x4unity_Projector[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_Projector[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_Projector[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ProjectorClip[1];
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ProjectorClip[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FalloffTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat16_0 = texture(_FalloffTex, u_xlat0.xy).w;
    u_xlat3.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat16_1 = texture(_ShadowTex, u_xlat3.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.w = (-u_xlat16_1.w) + 1.0;
    SV_Target0 = vec4(u_xlat16_0) * u_xlat16_2 + vec4(1.0, 1.0, 1.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_Projector[4];
uniform 	vec4 hlslcc_mtx4x4unity_ProjectorClip[4];
in highp vec4 in_POSITION0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_Projector[1];
    u_xlat0 = hlslcc_mtx4x4unity_Projector[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_Projector[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_Projector[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ProjectorClip[1];
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ProjectorClip[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FalloffTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat16_0 = texture(_FalloffTex, u_xlat0.xy).w;
    u_xlat3.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat16_1 = texture(_ShadowTex, u_xlat3.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.w = (-u_xlat16_1.w) + 1.0;
    SV_Target0 = vec4(u_xlat16_0) * u_xlat16_2 + vec4(1.0, 1.0, 1.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 hlslcc_mtx4x4unity_Projector[4];
uniform 	vec4 hlslcc_mtx4x4unity_ProjectorClip[4];
in highp vec4 in_POSITION0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_Projector[1];
    u_xlat0 = hlslcc_mtx4x4unity_Projector[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_Projector[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_Projector[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ProjectorClip[1];
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ProjectorClip[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FalloffTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat16_0 = texture(_FalloffTex, u_xlat0.xy).w;
    u_xlat3.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat16_1 = texture(_ShadowTex, u_xlat3.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.w = (-u_xlat16_1.w) + 1.0;
    SV_Target0 = vec4(u_xlat16_0) * u_xlat16_2 + vec4(1.0, 1.0, 1.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 hlslcc_mtx4x4unity_Projector[4];
uniform 	vec4 hlslcc_mtx4x4unity_ProjectorClip[4];
attribute highp vec4 in_POSITION0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_Projector[1];
    u_xlat0 = hlslcc_mtx4x4unity_Projector[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_Projector[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_Projector[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ProjectorClip[1];
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ProjectorClip[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform lowp sampler2D _ShadowTex;
uniform lowp sampler2D _FalloffTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp float vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat10_0 = texture2D(_FalloffTex, u_xlat0.xy).w;
    u_xlat3.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_1 = texture2D(_ShadowTex, u_xlat3.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.w = (-u_xlat10_1.w) + 1.0;
    u_xlat16_0 = vec4(u_xlat10_0) * u_xlat16_2;
    u_xlat1.x = vs_TEXCOORD2;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_0.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 hlslcc_mtx4x4unity_Projector[4];
uniform 	vec4 hlslcc_mtx4x4unity_ProjectorClip[4];
attribute highp vec4 in_POSITION0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_Projector[1];
    u_xlat0 = hlslcc_mtx4x4unity_Projector[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_Projector[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_Projector[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ProjectorClip[1];
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ProjectorClip[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform lowp sampler2D _ShadowTex;
uniform lowp sampler2D _FalloffTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp float vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat10_0 = texture2D(_FalloffTex, u_xlat0.xy).w;
    u_xlat3.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_1 = texture2D(_ShadowTex, u_xlat3.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.w = (-u_xlat10_1.w) + 1.0;
    u_xlat16_0 = vec4(u_xlat10_0) * u_xlat16_2;
    u_xlat1.x = vs_TEXCOORD2;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_0.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 hlslcc_mtx4x4unity_Projector[4];
uniform 	vec4 hlslcc_mtx4x4unity_ProjectorClip[4];
attribute highp vec4 in_POSITION0;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_Projector[1];
    u_xlat0 = hlslcc_mtx4x4unity_Projector[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_Projector[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_Projector[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ProjectorClip[1];
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ProjectorClip[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform lowp sampler2D _ShadowTex;
uniform lowp sampler2D _FalloffTex;
varying highp vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp float vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
lowp float u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat10_0 = texture2D(_FalloffTex, u_xlat0.xy).w;
    u_xlat3.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat10_1 = texture2D(_ShadowTex, u_xlat3.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.w = (-u_xlat10_1.w) + 1.0;
    u_xlat16_0 = vec4(u_xlat10_0) * u_xlat16_2;
    u_xlat1.x = vs_TEXCOORD2;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_0.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 hlslcc_mtx4x4unity_Projector[4];
uniform 	vec4 hlslcc_mtx4x4unity_ProjectorClip[4];
in highp vec4 in_POSITION0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_Projector[1];
    u_xlat0 = hlslcc_mtx4x4unity_Projector[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_Projector[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_Projector[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ProjectorClip[1];
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ProjectorClip[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FalloffTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp float vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat16_0.x = texture(_FalloffTex, u_xlat0.xy).w;
    u_xlat3.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat16_1 = texture(_ShadowTex, u_xlat3.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.w = (-u_xlat16_1.w) + 1.0;
    u_xlat16_0 = u_xlat16_0.xxxx * u_xlat16_2;
    u_xlat1.x = vs_TEXCOORD2;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_0.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 hlslcc_mtx4x4unity_Projector[4];
uniform 	vec4 hlslcc_mtx4x4unity_ProjectorClip[4];
in highp vec4 in_POSITION0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_Projector[1];
    u_xlat0 = hlslcc_mtx4x4unity_Projector[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_Projector[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_Projector[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ProjectorClip[1];
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ProjectorClip[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FalloffTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp float vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat16_0.x = texture(_FalloffTex, u_xlat0.xy).w;
    u_xlat3.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat16_1 = texture(_ShadowTex, u_xlat3.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.w = (-u_xlat16_1.w) + 1.0;
    u_xlat16_0 = u_xlat16_0.xxxx * u_xlat16_2;
    u_xlat1.x = vs_TEXCOORD2;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_0.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	vec4 hlslcc_mtx4x4unity_Projector[4];
uniform 	vec4 hlslcc_mtx4x4unity_ProjectorClip[4];
in highp vec4 in_POSITION0;
out highp vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp float vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_Projector[1];
    u_xlat0 = hlslcc_mtx4x4unity_Projector[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_Projector[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD0 = hlslcc_mtx4x4unity_Projector[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ProjectorClip[1];
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ProjectorClip[2] * in_POSITION0.zzzz + u_xlat0;
    vs_TEXCOORD1 = hlslcc_mtx4x4unity_ProjectorClip[3] * in_POSITION0.wwww + u_xlat0;
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD2 = u_xlat0.z * unity_FogParams.z + unity_FogParams.w;
    gl_Position = u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _ShadowTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FalloffTex;
in highp vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
in highp float vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec2 u_xlat3;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.xy / vs_TEXCOORD1.ww;
    u_xlat16_0.x = texture(_FalloffTex, u_xlat0.xy).w;
    u_xlat3.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat16_1 = texture(_ShadowTex, u_xlat3.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.w = (-u_xlat16_1.w) + 1.0;
    u_xlat16_0 = u_xlat16_0.xxxx * u_xlat16_2;
    u_xlat1.x = vs_TEXCOORD2;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_0.xyz + vec3(1.0, 1.0, 1.0);
    SV_Target0.w = u_xlat16_0.w;
    SV_Target0.xyz = u_xlat1.xyz;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles hw_tier02 " {
""
}
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier02 " {
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "FOG_LINEAR" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "FOG_LINEAR" }
""
}
}
}
}
}