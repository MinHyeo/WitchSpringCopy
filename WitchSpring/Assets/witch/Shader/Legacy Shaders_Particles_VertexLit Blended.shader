//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Legacy Shaders/Particles/VertexLit Blended" {
Properties {
_EmisColor ("Emissive Color", Color) = (0.2,0.2,0.2,0)
_MainTex ("Particle Texture", 2D) = "white" { }
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "Vertex" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "Vertex" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ColorMask RGB 0
  ZWrite Off
  Cull Off
  Fog {
   Mode Off
  }
  GpuProgramID 59586
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _EmisColor;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, unity_LightPosition[0].xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xxx * in_COLOR0.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * unity_LightColor[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_3.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[1].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[2].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[2].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[3].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[3].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[4].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[4].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[5].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[5].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[6].xyz);
    u_xlat16_3.x = dot(u_xlat0.xyz, unity_LightPosition[7].xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.xyz = u_xlat16_3.xxx * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[7].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * unity_LightColor[6].xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    vs_COLOR0.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = in_COLOR0.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat10_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _EmisColor;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, unity_LightPosition[0].xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xxx * in_COLOR0.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * unity_LightColor[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_3.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[1].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[2].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[2].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[3].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[3].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[4].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[4].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[5].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[5].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[6].xyz);
    u_xlat16_3.x = dot(u_xlat0.xyz, unity_LightPosition[7].xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.xyz = u_xlat16_3.xxx * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[7].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * unity_LightColor[6].xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    vs_COLOR0.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = in_COLOR0.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat10_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _EmisColor;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, unity_LightPosition[0].xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xxx * in_COLOR0.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * unity_LightColor[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_3.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[1].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[2].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[2].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[3].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[3].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[4].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[4].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[5].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[5].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[6].xyz);
    u_xlat16_3.x = dot(u_xlat0.xyz, unity_LightPosition[7].xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.xyz = u_xlat16_3.xxx * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[7].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * unity_LightColor[6].xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    vs_COLOR0.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = in_COLOR0.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat10_0 * vs_COLOR0;
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
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _EmisColor;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
int u_xlati15;
mediump float u_xlat16_18;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat0.z = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_18 = dot(u_xlat0.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_18 = max(u_xlat16_18, 0.0);
        u_xlat16_4.xyz = vec3(u_xlat16_18) * in_COLOR0.xyz;
        u_xlat16_4.xyz = u_xlat16_4.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_1.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
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
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _EmisColor;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
int u_xlati15;
mediump float u_xlat16_18;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat0.z = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_18 = dot(u_xlat0.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_18 = max(u_xlat16_18, 0.0);
        u_xlat16_4.xyz = vec3(u_xlat16_18) * in_COLOR0.xyz;
        u_xlat16_4.xyz = u_xlat16_4.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_1.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
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
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _EmisColor;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
int u_xlati15;
mediump float u_xlat16_18;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat2.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat0.z = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_18 = dot(u_xlat0.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_18 = max(u_xlat16_18, 0.0);
        u_xlat16_4.xyz = vec3(u_xlat16_18) * in_COLOR0.xyz;
        u_xlat16_4.xyz = u_xlat16_4.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_1.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat16_1;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _EmisColor;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb13;
float u_xlat27;
int u_xlati27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat28 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat30 = unity_LightAtten[u_xlati_loop_1].z * u_xlat28 + 1.0;
        u_xlat30 = float(1.0) / u_xlat30;
        u_xlatb4 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat28;
        u_xlatb4 = u_xlatb13 && u_xlatb4;
        u_xlat28 = max(u_xlat28, 9.99999997e-07);
        u_xlat28 = inversesqrt(u_xlat28);
        u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
        u_xlat28 = u_xlat30 * 0.5;
        u_xlat16_34 = (u_xlatb4) ? 0.0 : u_xlat28;
        u_xlat16_8.x = dot(u_xlat1.xyz, u_xlat3.xyz);
        u_xlat16_8.x = max(u_xlat16_8.x, 0.0);
        u_xlat16_8.xyz = u_xlat16_8.xxx * in_COLOR0.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_8.xyz;
    }
    u_xlat16_2.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat16_2;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat10_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _EmisColor;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb13;
float u_xlat27;
int u_xlati27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat28 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat30 = unity_LightAtten[u_xlati_loop_1].z * u_xlat28 + 1.0;
        u_xlat30 = float(1.0) / u_xlat30;
        u_xlatb4 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat28;
        u_xlatb4 = u_xlatb13 && u_xlatb4;
        u_xlat28 = max(u_xlat28, 9.99999997e-07);
        u_xlat28 = inversesqrt(u_xlat28);
        u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
        u_xlat28 = u_xlat30 * 0.5;
        u_xlat16_34 = (u_xlatb4) ? 0.0 : u_xlat28;
        u_xlat16_8.x = dot(u_xlat1.xyz, u_xlat3.xyz);
        u_xlat16_8.x = max(u_xlat16_8.x, 0.0);
        u_xlat16_8.xyz = u_xlat16_8.xxx * in_COLOR0.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_8.xyz;
    }
    u_xlat16_2.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat16_2;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat10_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _EmisColor;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb13;
float u_xlat27;
int u_xlati27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat28 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat30 = unity_LightAtten[u_xlati_loop_1].z * u_xlat28 + 1.0;
        u_xlat30 = float(1.0) / u_xlat30;
        u_xlatb4 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat28;
        u_xlatb4 = u_xlatb13 && u_xlatb4;
        u_xlat28 = max(u_xlat28, 9.99999997e-07);
        u_xlat28 = inversesqrt(u_xlat28);
        u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
        u_xlat28 = u_xlat30 * 0.5;
        u_xlat16_34 = (u_xlatb4) ? 0.0 : u_xlat28;
        u_xlat16_8.x = dot(u_xlat1.xyz, u_xlat3.xyz);
        u_xlat16_8.x = max(u_xlat16_8.x, 0.0);
        u_xlat16_8.xyz = u_xlat16_8.xxx * in_COLOR0.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_8.xyz;
    }
    u_xlat16_2.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat16_2;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat10_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT" }
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
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _EmisColor;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
bool u_xlatb14;
float u_xlat15;
float u_xlat21;
int u_xlati21;
bool u_xlatb21;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[1].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[1].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = float(1.0) / u_xlat2.x;
    u_xlat21 = u_xlat21 * 0.5;
    u_xlat16_3.x = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * in_COLOR0.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[0].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[0].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb23 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb23;
    u_xlat23 = unity_LightAtten[0].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
    u_xlat21 = float(1.0) / u_xlat23;
    u_xlat21 = u_xlat21 * 0.5;
    u_xlat16_24 = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_6.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb21 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb21)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati21 = u_xlatb21 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlati21 = (u_xlatb1) ? 2 : u_xlati21;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[2].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[3].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 3 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[4].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 4 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[5].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 5 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[6].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 6 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat8.x, 9.99999997e-07);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat8.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat8.x;
#endif
    u_xlat7 = unity_LightAtten[7].z * u_xlat8.x + 1.0;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat7 = u_xlat7 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb14 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb14;
    u_xlat16_24 = (u_xlatb0) ? 0.0 : u_xlat7;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" }
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
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _EmisColor;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
bool u_xlatb14;
float u_xlat15;
float u_xlat21;
int u_xlati21;
bool u_xlatb21;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[1].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[1].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = float(1.0) / u_xlat2.x;
    u_xlat21 = u_xlat21 * 0.5;
    u_xlat16_3.x = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * in_COLOR0.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[0].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[0].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb23 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb23;
    u_xlat23 = unity_LightAtten[0].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
    u_xlat21 = float(1.0) / u_xlat23;
    u_xlat21 = u_xlat21 * 0.5;
    u_xlat16_24 = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_6.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb21 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb21)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati21 = u_xlatb21 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlati21 = (u_xlatb1) ? 2 : u_xlati21;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[2].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[3].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 3 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[4].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 4 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[5].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 5 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[6].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 6 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat8.x, 9.99999997e-07);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat8.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat8.x;
#endif
    u_xlat7 = unity_LightAtten[7].z * u_xlat8.x + 1.0;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat7 = u_xlat7 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb14 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb14;
    u_xlat16_24 = (u_xlatb0) ? 0.0 : u_xlat7;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" }
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
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _EmisColor;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
bool u_xlatb14;
float u_xlat15;
float u_xlat21;
int u_xlati21;
bool u_xlatb21;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[1].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[1].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = float(1.0) / u_xlat2.x;
    u_xlat21 = u_xlat21 * 0.5;
    u_xlat16_3.x = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * in_COLOR0.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[0].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[0].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb23 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb23;
    u_xlat23 = unity_LightAtten[0].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
    u_xlat21 = float(1.0) / u_xlat23;
    u_xlat21 = u_xlat21 * 0.5;
    u_xlat16_24 = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_6.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb21 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb21)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati21 = u_xlatb21 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlati21 = (u_xlatb1) ? 2 : u_xlati21;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[2].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[3].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 3 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[4].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 4 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[5].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 5 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[6].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 6 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat8.x, 9.99999997e-07);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat8.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat8.x;
#endif
    u_xlat7 = unity_LightAtten[7].z * u_xlat8.x + 1.0;
    u_xlat7 = float(1.0) / u_xlat7;
    u_xlat7 = u_xlat7 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb14 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb14;
    u_xlat16_24 = (u_xlatb0) ? 0.0 : u_xlat7;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _EmisColor;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb13;
float u_xlat27;
int u_xlati27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat28 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat30 = unity_LightAtten[u_xlati_loop_1].z * u_xlat28 + 1.0;
        u_xlat30 = float(1.0) / u_xlat30;
        u_xlatb4 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat28;
        u_xlatb4 = u_xlatb13 && u_xlatb4;
        u_xlat16_34 = (u_xlatb4) ? 0.0 : u_xlat30;
        u_xlat28 = max(u_xlat28, 9.99999997e-07);
        u_xlat28 = inversesqrt(u_xlat28);
        u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
        u_xlat28 = dot(u_xlat3.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat28 = max(u_xlat28, 0.0);
        u_xlat16_8.x = u_xlat28 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16_8.x = u_xlat16_8.x * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
        u_xlat16_34 = u_xlat16_34 * u_xlat16_8.x;
        u_xlat16_34 = u_xlat16_34 * 0.5;
        u_xlat16_8.x = dot(u_xlat1.xyz, u_xlat3.xyz);
        u_xlat16_8.x = max(u_xlat16_8.x, 0.0);
        u_xlat16_8.xyz = u_xlat16_8.xxx * in_COLOR0.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_8.xyz;
    }
    u_xlat16_2.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat16_2;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat10_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _EmisColor;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb13;
float u_xlat27;
int u_xlati27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat28 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat30 = unity_LightAtten[u_xlati_loop_1].z * u_xlat28 + 1.0;
        u_xlat30 = float(1.0) / u_xlat30;
        u_xlatb4 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat28;
        u_xlatb4 = u_xlatb13 && u_xlatb4;
        u_xlat16_34 = (u_xlatb4) ? 0.0 : u_xlat30;
        u_xlat28 = max(u_xlat28, 9.99999997e-07);
        u_xlat28 = inversesqrt(u_xlat28);
        u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
        u_xlat28 = dot(u_xlat3.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat28 = max(u_xlat28, 0.0);
        u_xlat16_8.x = u_xlat28 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16_8.x = u_xlat16_8.x * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
        u_xlat16_34 = u_xlat16_34 * u_xlat16_8.x;
        u_xlat16_34 = u_xlat16_34 * 0.5;
        u_xlat16_8.x = dot(u_xlat1.xyz, u_xlat3.xyz);
        u_xlat16_8.x = max(u_xlat16_8.x, 0.0);
        u_xlat16_8.xyz = u_xlat16_8.xxx * in_COLOR0.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_8.xyz;
    }
    u_xlat16_2.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat16_2;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat10_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _EmisColor;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb13;
float u_xlat27;
int u_xlati27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat28 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat30 = unity_LightAtten[u_xlati_loop_1].z * u_xlat28 + 1.0;
        u_xlat30 = float(1.0) / u_xlat30;
        u_xlatb4 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat28;
        u_xlatb4 = u_xlatb13 && u_xlatb4;
        u_xlat16_34 = (u_xlatb4) ? 0.0 : u_xlat30;
        u_xlat28 = max(u_xlat28, 9.99999997e-07);
        u_xlat28 = inversesqrt(u_xlat28);
        u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
        u_xlat28 = dot(u_xlat3.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat28 = max(u_xlat28, 0.0);
        u_xlat16_8.x = u_xlat28 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16_8.x = u_xlat16_8.x * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
        u_xlat16_34 = u_xlat16_34 * u_xlat16_8.x;
        u_xlat16_34 = u_xlat16_34 * 0.5;
        u_xlat16_8.x = dot(u_xlat1.xyz, u_xlat3.xyz);
        u_xlat16_8.x = max(u_xlat16_8.x, 0.0);
        u_xlat16_8.xyz = u_xlat16_8.xxx * in_COLOR0.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_8.xyz;
    }
    u_xlat16_2.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat16_2;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat10_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SPOT" }
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
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _EmisColor;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb14;
float u_xlat15;
float u_xlat21;
int u_xlati21;
bool u_xlatb21;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[1].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[1].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = float(1.0) / u_xlat2.x;
    u_xlat16_3.x = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat21 = dot(u_xlat1.xyz, unity_SpotDirection[1].xyz);
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat16_10.x = u_xlat21 + (-unity_LightAtten[1].x);
    u_xlat16_10.x = u_xlat16_10.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_10.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * 0.5;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * in_COLOR0.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[0].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[0].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb23 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb23;
    u_xlat23 = unity_LightAtten[0].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = float(1.0) / u_xlat23;
    u_xlat16_24 = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat21 = dot(u_xlat1.xyz, unity_SpotDirection[0].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat16_26 = u_xlat21 + (-unity_LightAtten[0].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_6.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb21 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb21)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati21 = u_xlatb21 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlati21 = (u_xlatb1) ? 2 : u_xlati21;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[2].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[2].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[3].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[3].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[3].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 3 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[4].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[4].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[4].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 4 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[5].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[5].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[5].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 5 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[6].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[6].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[6].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 6 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat8.x, 9.99999997e-07);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat15 = dot(u_xlat0.xyz, unity_SpotDirection[7].xyz);
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
    u_xlat0.x = max(u_xlat15, 0.0);
    u_xlat16_24 = u_xlat0.x + (-unity_LightAtten[7].x);
    u_xlat16_24 = u_xlat16_24 * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24 = min(max(u_xlat16_24, 0.0), 1.0);
#else
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat8.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat8.x;
#endif
    u_xlat7 = unity_LightAtten[7].z * u_xlat8.x + 1.0;
    u_xlat7 = float(1.0) / u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb14 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb14;
    u_xlat16_26 = (u_xlatb0) ? 0.0 : u_xlat7;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" }
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
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _EmisColor;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb14;
float u_xlat15;
float u_xlat21;
int u_xlati21;
bool u_xlatb21;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[1].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[1].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = float(1.0) / u_xlat2.x;
    u_xlat16_3.x = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat21 = dot(u_xlat1.xyz, unity_SpotDirection[1].xyz);
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat16_10.x = u_xlat21 + (-unity_LightAtten[1].x);
    u_xlat16_10.x = u_xlat16_10.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_10.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * 0.5;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * in_COLOR0.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[0].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[0].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb23 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb23;
    u_xlat23 = unity_LightAtten[0].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = float(1.0) / u_xlat23;
    u_xlat16_24 = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat21 = dot(u_xlat1.xyz, unity_SpotDirection[0].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat16_26 = u_xlat21 + (-unity_LightAtten[0].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_6.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb21 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb21)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati21 = u_xlatb21 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlati21 = (u_xlatb1) ? 2 : u_xlati21;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[2].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[2].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[3].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[3].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[3].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 3 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[4].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[4].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[4].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 4 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[5].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[5].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[5].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 5 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[6].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[6].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[6].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 6 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat8.x, 9.99999997e-07);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat15 = dot(u_xlat0.xyz, unity_SpotDirection[7].xyz);
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
    u_xlat0.x = max(u_xlat15, 0.0);
    u_xlat16_24 = u_xlat0.x + (-unity_LightAtten[7].x);
    u_xlat16_24 = u_xlat16_24 * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24 = min(max(u_xlat16_24, 0.0), 1.0);
#else
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat8.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat8.x;
#endif
    u_xlat7 = unity_LightAtten[7].z * u_xlat8.x + 1.0;
    u_xlat7 = float(1.0) / u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb14 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb14;
    u_xlat16_26 = (u_xlatb0) ? 0.0 : u_xlat7;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" }
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
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _EmisColor;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb14;
float u_xlat15;
float u_xlat21;
int u_xlati21;
bool u_xlatb21;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
mediump float u_xlat16_26;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[1].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[1].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = float(1.0) / u_xlat2.x;
    u_xlat16_3.x = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat21 = dot(u_xlat1.xyz, unity_SpotDirection[1].xyz);
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat16_10.x = u_xlat21 + (-unity_LightAtten[1].x);
    u_xlat16_10.x = u_xlat16_10.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_10.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * 0.5;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * in_COLOR0.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat21 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[0].w<u_xlat21);
#else
    u_xlatb22 = unity_LightAtten[0].w<u_xlat21;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb23 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb23;
    u_xlat23 = unity_LightAtten[0].z * u_xlat21 + 1.0;
    u_xlat21 = max(u_xlat21, 9.99999997e-07);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat1.xyz = vec3(u_xlat21) * u_xlat1.xyz;
    u_xlat21 = float(1.0) / u_xlat23;
    u_xlat16_24 = (u_xlatb22) ? 0.0 : u_xlat21;
    u_xlat21 = dot(u_xlat1.xyz, unity_SpotDirection[0].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
    u_xlat21 = max(u_xlat21, 0.0);
    u_xlat16_26 = u_xlat21 + (-unity_LightAtten[0].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_6.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb21 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb21)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati21 = u_xlatb21 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlati21 = (u_xlatb1) ? 2 : u_xlati21;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[2].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[2].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[3].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[3].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[3].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 3 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[4].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[4].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[4].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 4 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[5].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[5].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[5].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 5 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[6].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[6].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[6].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati21 = (u_xlatb1) ? 6 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati21<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati21<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = max(u_xlat8.x, 9.99999997e-07);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat15);
    u_xlat15 = dot(u_xlat0.xyz, unity_SpotDirection[7].xyz);
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat0.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
    u_xlat0.x = max(u_xlat15, 0.0);
    u_xlat16_24 = u_xlat0.x + (-unity_LightAtten[7].x);
    u_xlat16_24 = u_xlat16_24 * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24 = min(max(u_xlat16_24, 0.0), 1.0);
#else
    u_xlat16_24 = clamp(u_xlat16_24, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightAtten[7].w<u_xlat8.x);
#else
    u_xlatb0 = unity_LightAtten[7].w<u_xlat8.x;
#endif
    u_xlat7 = unity_LightAtten[7].z * u_xlat8.x + 1.0;
    u_xlat7 = float(1.0) / u_xlat7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb14 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb14;
    u_xlat16_26 = (u_xlatb0) ? 0.0 : u_xlat7;
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    SV_Target0 = u_xlat16_0 * vs_COLOR0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _EmisColor;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, unity_LightPosition[0].xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xxx * in_COLOR0.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * unity_LightColor[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_3.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[1].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[2].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[2].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[3].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[3].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[4].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[4].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[5].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[5].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[6].xyz);
    u_xlat16_3.x = dot(u_xlat0.xyz, unity_LightPosition[7].xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.xyz = u_xlat16_3.xxx * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[7].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * unity_LightColor[6].xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    vs_COLOR0.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = in_COLOR0.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    vs_TEXCOORD1 = u_xlat0.x;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = vs_COLOR0.xyz * u_xlat10_0.xyz + (-unity_FogColor.xyz);
    u_xlat16_7 = u_xlat10_0.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_7;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _EmisColor;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, unity_LightPosition[0].xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xxx * in_COLOR0.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * unity_LightColor[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_3.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[1].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[2].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[2].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[3].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[3].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[4].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[4].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[5].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[5].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[6].xyz);
    u_xlat16_3.x = dot(u_xlat0.xyz, unity_LightPosition[7].xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.xyz = u_xlat16_3.xxx * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[7].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * unity_LightColor[6].xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    vs_COLOR0.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = in_COLOR0.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    vs_TEXCOORD1 = u_xlat0.x;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = vs_COLOR0.xyz * u_xlat10_0.xyz + (-unity_FogColor.xyz);
    u_xlat16_7 = u_xlat10_0.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_7;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _EmisColor;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat1.xyz;
    u_xlat0.y = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat1.xyz;
    u_xlat0.z = dot(u_xlat1.xyz, in_NORMAL0.xyz);
    u_xlat15 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat15 = inversesqrt(u_xlat15);
    u_xlat0.xyz = vec3(u_xlat15) * u_xlat0.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, unity_LightPosition[0].xyz);
    u_xlat16_2.x = max(u_xlat16_2.x, 0.0);
    u_xlat16_2.xyz = u_xlat16_2.xxx * in_COLOR0.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * unity_LightColor[0].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_3.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[1].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[2].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[2].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[3].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[3].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[4].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[4].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[5].xyz);
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_3.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[5].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, unity_LightPosition[6].xyz);
    u_xlat16_3.x = dot(u_xlat0.xyz, unity_LightPosition[7].xyz);
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.xyz = u_xlat16_3.xxx * in_COLOR0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * unity_LightColor[7].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_17 = max(u_xlat16_17, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_17) * in_COLOR0.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * unity_LightColor[6].xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(0.5, 0.5, 0.5);
    u_xlat16_4.xyz = min(u_xlat16_4.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_4.xyz;
    vs_COLOR0.xyz = u_xlat16_3.xyz + u_xlat16_2.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = in_COLOR0.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    vs_TEXCOORD1 = u_xlat0.x;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = vs_COLOR0.xyz * u_xlat10_0.xyz + (-unity_FogColor.xyz);
    u_xlat16_7 = u_xlat10_0.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_7;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
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
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _EmisColor;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump float vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
float u_xlat27;
int u_xlati27;
bool u_xlatb28;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_34 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_34 = max(u_xlat16_34, 0.0);
        u_xlat16_8.xyz = vec3(u_xlat16_34) * in_COLOR0.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_8.xyz;
    }
    u_xlat16_2.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat0.x;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
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
uniform 	mediump vec4 unity_FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump float vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = vs_COLOR0.xyz * u_xlat16_0.xyz + (-unity_FogColor.xyz);
    u_xlat16_7 = u_xlat16_0.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_7;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
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
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _EmisColor;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump float vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
float u_xlat27;
int u_xlati27;
bool u_xlatb28;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_34 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_34 = max(u_xlat16_34, 0.0);
        u_xlat16_8.xyz = vec3(u_xlat16_34) * in_COLOR0.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_8.xyz;
    }
    u_xlat16_2.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat0.x;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
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
uniform 	mediump vec4 unity_FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump float vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = vs_COLOR0.xyz * u_xlat16_0.xyz + (-unity_FogColor.xyz);
    u_xlat16_7 = u_xlat16_0.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_7;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
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
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _EmisColor;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump float vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
float u_xlat27;
int u_xlati27;
bool u_xlatb28;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_34 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_34 = max(u_xlat16_34, 0.0);
        u_xlat16_8.xyz = vec3(u_xlat16_34) * in_COLOR0.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_8.xyz;
    }
    u_xlat16_2.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat16_2;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat0.x;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
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
uniform 	mediump vec4 unity_FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump float vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = vs_COLOR0.xyz * u_xlat16_0.xyz + (-unity_FogColor.xyz);
    u_xlat16_7 = u_xlat16_0.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_7;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "POINT" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _EmisColor;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb13;
float u_xlat27;
int u_xlati27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat28 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat30 = unity_LightAtten[u_xlati_loop_1].z * u_xlat28 + 1.0;
        u_xlat30 = float(1.0) / u_xlat30;
        u_xlatb4 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat28;
        u_xlatb4 = u_xlatb13 && u_xlatb4;
        u_xlat28 = max(u_xlat28, 9.99999997e-07);
        u_xlat28 = inversesqrt(u_xlat28);
        u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
        u_xlat28 = u_xlat30 * 0.5;
        u_xlat16_34 = (u_xlatb4) ? 0.0 : u_xlat28;
        u_xlat16_8.x = dot(u_xlat1.xyz, u_xlat3.xyz);
        u_xlat16_8.x = max(u_xlat16_8.x, 0.0);
        u_xlat16_8.xyz = u_xlat16_8.xxx * in_COLOR0.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_8.xyz;
    }
    u_xlat16_2.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat16_2;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat0.x;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = vs_COLOR0.xyz * u_xlat10_0.xyz + (-unity_FogColor.xyz);
    u_xlat16_7 = u_xlat10_0.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_7;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "POINT" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _EmisColor;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb13;
float u_xlat27;
int u_xlati27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat28 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat30 = unity_LightAtten[u_xlati_loop_1].z * u_xlat28 + 1.0;
        u_xlat30 = float(1.0) / u_xlat30;
        u_xlatb4 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat28;
        u_xlatb4 = u_xlatb13 && u_xlatb4;
        u_xlat28 = max(u_xlat28, 9.99999997e-07);
        u_xlat28 = inversesqrt(u_xlat28);
        u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
        u_xlat28 = u_xlat30 * 0.5;
        u_xlat16_34 = (u_xlatb4) ? 0.0 : u_xlat28;
        u_xlat16_8.x = dot(u_xlat1.xyz, u_xlat3.xyz);
        u_xlat16_8.x = max(u_xlat16_8.x, 0.0);
        u_xlat16_8.xyz = u_xlat16_8.xxx * in_COLOR0.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_8.xyz;
    }
    u_xlat16_2.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat16_2;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat0.x;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = vs_COLOR0.xyz * u_xlat10_0.xyz + (-unity_FogColor.xyz);
    u_xlat16_7 = u_xlat10_0.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_7;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "POINT" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _EmisColor;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb13;
float u_xlat27;
int u_xlati27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat28 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat30 = unity_LightAtten[u_xlati_loop_1].z * u_xlat28 + 1.0;
        u_xlat30 = float(1.0) / u_xlat30;
        u_xlatb4 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat28;
        u_xlatb4 = u_xlatb13 && u_xlatb4;
        u_xlat28 = max(u_xlat28, 9.99999997e-07);
        u_xlat28 = inversesqrt(u_xlat28);
        u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
        u_xlat28 = u_xlat30 * 0.5;
        u_xlat16_34 = (u_xlatb4) ? 0.0 : u_xlat28;
        u_xlat16_8.x = dot(u_xlat1.xyz, u_xlat3.xyz);
        u_xlat16_8.x = max(u_xlat16_8.x, 0.0);
        u_xlat16_8.xyz = u_xlat16_8.xxx * in_COLOR0.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_8.xyz;
    }
    u_xlat16_2.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat16_2;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat0.x;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = vs_COLOR0.xyz * u_xlat10_0.xyz + (-unity_FogColor.xyz);
    u_xlat16_7 = u_xlat10_0.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_7;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "FOG_LINEAR" "POINT" }
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
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _EmisColor;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump float vs_TEXCOORD1;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
float u_xlat14;
bool u_xlatb14;
float u_xlat15;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
mediump float u_xlat16_24;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat7.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat7.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat22);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat22;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat22 + 1.0;
    u_xlat22 = max(u_xlat22, 9.99999997e-07);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat22 = float(1.0) / u_xlat2.x;
    u_xlat22 = u_xlat22 * 0.5;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat22;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * in_COLOR0.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat22 = max(u_xlat0.x, 9.99999997e-07);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_LightAtten[0].w<u_xlat0.x);
#else
    u_xlatb1 = unity_LightAtten[0].w<u_xlat0.x;
#endif
    u_xlat0.x = unity_LightAtten[0].z * u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb8 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb1 = u_xlatb1 && u_xlatb8;
    u_xlat16_24 = (u_xlatb1) ? 0.0 : u_xlat0.x;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_6.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb0 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlati0 = (u_xlatb1) ? 2 : u_xlati0;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[2].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[3].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 3 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[4].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 4 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[5].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 5 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[6].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 6 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    vs_TEXCOORD1 = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat14 = max(u_xlat7.x, 9.99999997e-07);
    u_xlat14 = inversesqrt(u_xlat14);
    u_xlat8.xyz = vec3(u_xlat14) * u_xlat8.xyz;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb14 = unity_LightAtten[7].w<u_xlat7.x;
#endif
    u_xlat7.x = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb21 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb21;
    u_xlat16_24 = (u_xlatb14) ? 0.0 : u_xlat7.x;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 unity_FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump float vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = vs_COLOR0.xyz * u_xlat16_0.xyz + (-unity_FogColor.xyz);
    u_xlat16_7 = u_xlat16_0.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_7;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "FOG_LINEAR" "POINT" }
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
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _EmisColor;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump float vs_TEXCOORD1;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
float u_xlat14;
bool u_xlatb14;
float u_xlat15;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
mediump float u_xlat16_24;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat7.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat7.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat22);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat22;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat22 + 1.0;
    u_xlat22 = max(u_xlat22, 9.99999997e-07);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat22 = float(1.0) / u_xlat2.x;
    u_xlat22 = u_xlat22 * 0.5;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat22;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * in_COLOR0.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat22 = max(u_xlat0.x, 9.99999997e-07);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_LightAtten[0].w<u_xlat0.x);
#else
    u_xlatb1 = unity_LightAtten[0].w<u_xlat0.x;
#endif
    u_xlat0.x = unity_LightAtten[0].z * u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb8 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb1 = u_xlatb1 && u_xlatb8;
    u_xlat16_24 = (u_xlatb1) ? 0.0 : u_xlat0.x;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_6.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb0 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlati0 = (u_xlatb1) ? 2 : u_xlati0;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[2].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[3].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 3 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[4].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 4 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[5].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 5 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[6].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 6 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    vs_TEXCOORD1 = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat14 = max(u_xlat7.x, 9.99999997e-07);
    u_xlat14 = inversesqrt(u_xlat14);
    u_xlat8.xyz = vec3(u_xlat14) * u_xlat8.xyz;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb14 = unity_LightAtten[7].w<u_xlat7.x;
#endif
    u_xlat7.x = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb21 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb21;
    u_xlat16_24 = (u_xlatb14) ? 0.0 : u_xlat7.x;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 unity_FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump float vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = vs_COLOR0.xyz * u_xlat16_0.xyz + (-unity_FogColor.xyz);
    u_xlat16_7 = u_xlat16_0.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_7;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "FOG_LINEAR" "POINT" }
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
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _EmisColor;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump float vs_TEXCOORD1;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
float u_xlat14;
bool u_xlatb14;
float u_xlat15;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
mediump float u_xlat16_24;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat7.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat7.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat22);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat22;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat22 + 1.0;
    u_xlat22 = max(u_xlat22, 9.99999997e-07);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat22 = float(1.0) / u_xlat2.x;
    u_xlat22 = u_xlat22 * 0.5;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat22;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * in_COLOR0.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat22 = max(u_xlat0.x, 9.99999997e-07);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(unity_LightAtten[0].w<u_xlat0.x);
#else
    u_xlatb1 = unity_LightAtten[0].w<u_xlat0.x;
#endif
    u_xlat0.x = unity_LightAtten[0].z * u_xlat0.x + 1.0;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb8 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb1 = u_xlatb1 && u_xlatb8;
    u_xlat16_24 = (u_xlatb1) ? 0.0 : u_xlat0.x;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_6.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb0 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlati0 = (u_xlatb1) ? 2 : u_xlati0;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[2].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[3].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 3 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[4].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 4 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[5].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 5 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat4.x = max(u_xlat23, 9.99999997e-07);
    u_xlat4.x = inversesqrt(u_xlat4.x);
    u_xlat8.xyz = u_xlat8.xyz * u_xlat4.xxx;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb8 = unity_LightAtten[6].w<u_xlat23;
#endif
    u_xlat15 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat15 = float(1.0) / u_xlat15;
    u_xlat15 = u_xlat15 * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb22 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb8 = u_xlatb8 && u_xlatb22;
    u_xlat16_24 = (u_xlatb8) ? 0.0 : u_xlat15;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 6 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    vs_TEXCOORD1 = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat14 = max(u_xlat7.x, 9.99999997e-07);
    u_xlat14 = inversesqrt(u_xlat14);
    u_xlat8.xyz = vec3(u_xlat14) * u_xlat8.xyz;
    u_xlat16_24 = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_24 = max(u_xlat16_24, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_24) * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb14 = unity_LightAtten[7].w<u_xlat7.x;
#endif
    u_xlat7.x = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat7.x = float(1.0) / u_xlat7.x;
    u_xlat7.x = u_xlat7.x * 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb21 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb21;
    u_xlat16_24 = (u_xlatb14) ? 0.0 : u_xlat7.x;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 unity_FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump float vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = vs_COLOR0.xyz * u_xlat16_0.xyz + (-unity_FogColor.xyz);
    u_xlat16_7 = u_xlat16_0.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_7;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "SPOT" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _EmisColor;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb13;
float u_xlat27;
int u_xlati27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat28 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat30 = unity_LightAtten[u_xlati_loop_1].z * u_xlat28 + 1.0;
        u_xlat30 = float(1.0) / u_xlat30;
        u_xlatb4 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat28;
        u_xlatb4 = u_xlatb13 && u_xlatb4;
        u_xlat16_34 = (u_xlatb4) ? 0.0 : u_xlat30;
        u_xlat28 = max(u_xlat28, 9.99999997e-07);
        u_xlat28 = inversesqrt(u_xlat28);
        u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
        u_xlat28 = dot(u_xlat3.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat28 = max(u_xlat28, 0.0);
        u_xlat16_8.x = u_xlat28 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16_8.x = u_xlat16_8.x * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
        u_xlat16_34 = u_xlat16_34 * u_xlat16_8.x;
        u_xlat16_34 = u_xlat16_34 * 0.5;
        u_xlat16_8.x = dot(u_xlat1.xyz, u_xlat3.xyz);
        u_xlat16_8.x = max(u_xlat16_8.x, 0.0);
        u_xlat16_8.xyz = u_xlat16_8.xxx * in_COLOR0.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_8.xyz;
    }
    u_xlat16_2.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat16_2;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat0.x;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = vs_COLOR0.xyz * u_xlat10_0.xyz + (-unity_FogColor.xyz);
    u_xlat16_7 = u_xlat10_0.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_7;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "SPOT" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _EmisColor;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb13;
float u_xlat27;
int u_xlati27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat28 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat30 = unity_LightAtten[u_xlati_loop_1].z * u_xlat28 + 1.0;
        u_xlat30 = float(1.0) / u_xlat30;
        u_xlatb4 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat28;
        u_xlatb4 = u_xlatb13 && u_xlatb4;
        u_xlat16_34 = (u_xlatb4) ? 0.0 : u_xlat30;
        u_xlat28 = max(u_xlat28, 9.99999997e-07);
        u_xlat28 = inversesqrt(u_xlat28);
        u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
        u_xlat28 = dot(u_xlat3.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat28 = max(u_xlat28, 0.0);
        u_xlat16_8.x = u_xlat28 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16_8.x = u_xlat16_8.x * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
        u_xlat16_34 = u_xlat16_34 * u_xlat16_8.x;
        u_xlat16_34 = u_xlat16_34 * 0.5;
        u_xlat16_8.x = dot(u_xlat1.xyz, u_xlat3.xyz);
        u_xlat16_8.x = max(u_xlat16_8.x, 0.0);
        u_xlat16_8.xyz = u_xlat16_8.xxx * in_COLOR0.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_8.xyz;
    }
    u_xlat16_2.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat16_2;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat0.x;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = vs_COLOR0.xyz * u_xlat10_0.xyz + (-unity_FogColor.xyz);
    u_xlat16_7 = u_xlat10_0.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_7;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "SPOT" }
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _EmisColor;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute mediump vec4 in_COLOR0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb13;
float u_xlat27;
int u_xlati27;
float u_xlat28;
bool u_xlatb28;
float u_xlat30;
mediump float u_xlat16_34;
void main()
{
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat0.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat1.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat2.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat3.xyz;
    u_xlat3.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat3.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat6.xyz;
    u_xlat6.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat6.xyz;
    u_xlat1.xyz = u_xlat1.xyz * in_POSITION0.yyy;
    u_xlat0.xyz = u_xlat0.xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat2.xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat3.xyz + u_xlat0.xyz;
    u_xlat1.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat1.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat1.z = dot(u_xlat6.xyz, in_NORMAL0.xyz);
    u_xlat27 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27 = inversesqrt(u_xlat27);
    u_xlat1.xyz = vec3(u_xlat27) * u_xlat1.xyz;
    u_xlat16_7.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz;
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat28 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat30 = unity_LightAtten[u_xlati_loop_1].z * u_xlat28 + 1.0;
        u_xlat30 = float(1.0) / u_xlat30;
        u_xlatb4 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb13 = unity_LightAtten[u_xlati_loop_1].w<u_xlat28;
        u_xlatb4 = u_xlatb13 && u_xlatb4;
        u_xlat16_34 = (u_xlatb4) ? 0.0 : u_xlat30;
        u_xlat28 = max(u_xlat28, 9.99999997e-07);
        u_xlat28 = inversesqrt(u_xlat28);
        u_xlat3.xyz = vec3(u_xlat28) * u_xlat3.xyz;
        u_xlat28 = dot(u_xlat3.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat28 = max(u_xlat28, 0.0);
        u_xlat16_8.x = u_xlat28 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16_8.x = u_xlat16_8.x * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
        u_xlat16_34 = u_xlat16_34 * u_xlat16_8.x;
        u_xlat16_34 = u_xlat16_34 * 0.5;
        u_xlat16_8.x = dot(u_xlat1.xyz, u_xlat3.xyz);
        u_xlat16_8.x = max(u_xlat16_8.x, 0.0);
        u_xlat16_8.xyz = u_xlat16_8.xxx * in_COLOR0.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlat16_8.xyz = vec3(u_xlat16_34) * u_xlat16_8.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_2.xyz = u_xlat16_2.xyz + u_xlat16_8.xyz;
    }
    u_xlat16_2.w = in_COLOR0.w;
    vs_COLOR0 = u_xlat16_2;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * unity_FogParams.z + unity_FogParams.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    vs_TEXCOORD1 = u_xlat0.x;
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
uniform 	mediump vec4 unity_FogColor;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying mediump float vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat10_0 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = vs_COLOR0.xyz * u_xlat10_0.xyz + (-unity_FogColor.xyz);
    u_xlat16_7 = u_xlat10_0.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_7;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "FOG_LINEAR" "SPOT" }
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
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _EmisColor;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump float vs_TEXCOORD1;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat7.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat7.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat22);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat22;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat22 + 1.0;
    u_xlat22 = max(u_xlat22, 9.99999997e-07);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat22 = float(1.0) / u_xlat2.x;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat22;
    u_xlat0.x = dot(u_xlat1.xyz, unity_SpotDirection[1].xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_10.x = u_xlat0.x + (-unity_LightAtten[1].x);
    u_xlat16_10.x = u_xlat16_10.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_10.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * 0.5;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * in_COLOR0.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[0].w<u_xlat0.x);
#else
    u_xlatb22 = unity_LightAtten[0].w<u_xlat0.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb23 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb23;
    u_xlat23 = unity_LightAtten[0].z * u_xlat0.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 9.99999997e-07);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat0.x = float(1.0) / u_xlat23;
    u_xlat16_24 = (u_xlatb22) ? 0.0 : u_xlat0.x;
    u_xlat0.x = dot(u_xlat1.xyz, unity_SpotDirection[0].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_26 = u_xlat0.x + (-unity_LightAtten[0].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_6.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb0 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlati0 = (u_xlatb1) ? 2 : u_xlati0;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[2].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[2].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[3].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[3].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[3].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 3 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[4].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[4].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[4].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 4 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[5].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[5].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[5].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 5 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[6].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[6].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[6].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 6 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    vs_TEXCOORD1 = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb14 = unity_LightAtten[7].w<u_xlat7.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb21 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb21;
    u_xlat21 = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat7.x = max(u_xlat7.x, 9.99999997e-07);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat8.xyz = u_xlat7.xxx * u_xlat8.xyz;
    u_xlat7.x = float(1.0) / u_xlat21;
    u_xlat16_24 = (u_xlatb14) ? 0.0 : u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.xyz, unity_SpotDirection[7].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat16_26 = u_xlat7.x + (-unity_LightAtten[7].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 unity_FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump float vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = vs_COLOR0.xyz * u_xlat16_0.xyz + (-unity_FogColor.xyz);
    u_xlat16_7 = u_xlat16_0.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_7;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "FOG_LINEAR" "SPOT" }
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
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _EmisColor;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump float vs_TEXCOORD1;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat7.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat7.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat22);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat22;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat22 + 1.0;
    u_xlat22 = max(u_xlat22, 9.99999997e-07);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat22 = float(1.0) / u_xlat2.x;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat22;
    u_xlat0.x = dot(u_xlat1.xyz, unity_SpotDirection[1].xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_10.x = u_xlat0.x + (-unity_LightAtten[1].x);
    u_xlat16_10.x = u_xlat16_10.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_10.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * 0.5;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * in_COLOR0.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[0].w<u_xlat0.x);
#else
    u_xlatb22 = unity_LightAtten[0].w<u_xlat0.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb23 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb23;
    u_xlat23 = unity_LightAtten[0].z * u_xlat0.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 9.99999997e-07);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat0.x = float(1.0) / u_xlat23;
    u_xlat16_24 = (u_xlatb22) ? 0.0 : u_xlat0.x;
    u_xlat0.x = dot(u_xlat1.xyz, unity_SpotDirection[0].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_26 = u_xlat0.x + (-unity_LightAtten[0].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_6.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb0 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlati0 = (u_xlatb1) ? 2 : u_xlati0;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[2].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[2].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[3].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[3].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[3].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 3 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[4].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[4].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[4].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 4 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[5].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[5].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[5].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 5 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[6].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[6].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[6].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 6 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    vs_TEXCOORD1 = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb14 = unity_LightAtten[7].w<u_xlat7.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb21 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb21;
    u_xlat21 = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat7.x = max(u_xlat7.x, 9.99999997e-07);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat8.xyz = u_xlat7.xxx * u_xlat8.xyz;
    u_xlat7.x = float(1.0) / u_xlat21;
    u_xlat16_24 = (u_xlatb14) ? 0.0 : u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.xyz, unity_SpotDirection[7].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat16_26 = u_xlat7.x + (-unity_LightAtten[7].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 unity_FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump float vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = vs_COLOR0.xyz * u_xlat16_0.xyz + (-unity_FogColor.xyz);
    u_xlat16_7 = u_xlat16_0.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_7;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "FOG_LINEAR" "SPOT" }
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
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	mediump vec4 unity_LightAtten[8];
uniform 	vec4 unity_SpotDirection[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	mediump vec4 glstate_lightmodel_ambient;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _EmisColor;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in mediump vec4 in_COLOR0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out mediump float vs_TEXCOORD1;
vec4 u_xlat0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
bool u_xlatb1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_10;
float u_xlat11;
bool u_xlatb11;
bool u_xlatb14;
float u_xlat21;
bool u_xlatb21;
float u_xlat22;
bool u_xlatb22;
float u_xlat23;
bool u_xlatb23;
mediump float u_xlat16_24;
mediump float u_xlat16_26;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat7.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat7.xyz;
    u_xlat7.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat7.xyz;
    u_xlat7.xyz = u_xlat7.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat7.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat7.xyz = u_xlat7.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat22 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat22);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat22;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat22 + 1.0;
    u_xlat22 = max(u_xlat22, 9.99999997e-07);
    u_xlat22 = inversesqrt(u_xlat22);
    u_xlat1.xyz = vec3(u_xlat22) * u_xlat1.xyz;
    u_xlat22 = float(1.0) / u_xlat2.x;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat22;
    u_xlat0.x = dot(u_xlat1.xyz, unity_SpotDirection[1].xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_10.x = u_xlat0.x + (-unity_LightAtten[1].x);
    u_xlat16_10.x = u_xlat16_10.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_10.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * 0.5;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat2.xyz;
    u_xlat2.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat2.xyz;
    u_xlat2.x = dot(u_xlat2.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat4.xyz;
    u_xlat2.y = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat4.xyz;
    u_xlat2.z = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat16_10.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.xyz = u_xlat16_10.xxx * in_COLOR0.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_10.xyz;
    u_xlat16_3.xyz = min(u_xlat16_3.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat1.xyz = (-u_xlat7.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(unity_LightAtten[0].w<u_xlat0.x);
#else
    u_xlatb22 = unity_LightAtten[0].w<u_xlat0.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb23 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb23 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlatb22 = u_xlatb22 && u_xlatb23;
    u_xlat23 = unity_LightAtten[0].z * u_xlat0.x + 1.0;
    u_xlat0.x = max(u_xlat0.x, 9.99999997e-07);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat0.x = float(1.0) / u_xlat23;
    u_xlat16_24 = (u_xlatb22) ? 0.0 : u_xlat0.x;
    u_xlat0.x = dot(u_xlat1.xyz, unity_SpotDirection[0].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat1.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[0].xyz;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_26 = u_xlat0.x + (-unity_LightAtten[0].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_6.xyz = in_COLOR0.xyz * glstate_lightmodel_ambient.xyz + _EmisColor.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb0 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_5.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_6.xyz;
    u_xlati0 = u_xlatb0 ? 1 : int(0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb1 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlati0 = (u_xlatb1) ? 2 : u_xlati0;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_3.xyz : u_xlat16_5.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[2].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[2].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[2].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[2].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[2].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[2].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[3].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[3].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[3].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[3].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[3].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[3].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 3 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[4].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[4].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[4].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[4].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[4].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[4].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 4 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[5].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[5].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[5].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[5].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[5].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[5].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 5 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat23 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(unity_LightAtten[6].w<u_xlat23);
#else
    u_xlatb4 = unity_LightAtten[6].w<u_xlat23;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb11 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb11 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb4 = u_xlatb4 && u_xlatb11;
    u_xlat11 = unity_LightAtten[6].z * u_xlat23 + 1.0;
    u_xlat23 = max(u_xlat23, 9.99999997e-07);
    u_xlat23 = inversesqrt(u_xlat23);
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat23);
    u_xlat23 = float(1.0) / u_xlat11;
    u_xlat16_24 = (u_xlatb4) ? 0.0 : u_xlat23;
    u_xlat23 = dot(u_xlat8.xyz, unity_SpotDirection[6].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[6].xyz;
    u_xlat8.x = max(u_xlat23, 0.0);
    u_xlat16_26 = u_xlat8.x + (-unity_LightAtten[6].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 6 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb8 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb1 = u_xlatb8 && u_xlatb1;
    u_xlat16_3.xyz = (bool(u_xlatb1)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
    u_xlat8.xyz = (-u_xlat7.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat7.x = sqrt(u_xlat7.x);
    u_xlat7.x = u_xlat7.x * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    vs_TEXCOORD1 = u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(unity_LightAtten[7].w<u_xlat7.x);
#else
    u_xlatb14 = unity_LightAtten[7].w<u_xlat7.x;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb21 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb14 = u_xlatb14 && u_xlatb21;
    u_xlat21 = unity_LightAtten[7].z * u_xlat7.x + 1.0;
    u_xlat7.x = max(u_xlat7.x, 9.99999997e-07);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat8.xyz = u_xlat7.xxx * u_xlat8.xyz;
    u_xlat7.x = float(1.0) / u_xlat21;
    u_xlat16_24 = (u_xlatb14) ? 0.0 : u_xlat7.x;
    u_xlat7.x = dot(u_xlat8.xyz, unity_SpotDirection[7].xyz);
    u_xlat16_5.x = dot(u_xlat2.xyz, u_xlat8.xyz);
    u_xlat16_5.x = max(u_xlat16_5.x, 0.0);
    u_xlat16_5.xyz = u_xlat16_5.xxx * in_COLOR0.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * unity_LightColor[7].xyz;
    u_xlat7.x = max(u_xlat7.x, 0.0);
    u_xlat16_26 = u_xlat7.x + (-unity_LightAtten[7].x);
    u_xlat16_26 = u_xlat16_26 * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_26 = min(max(u_xlat16_26, 0.0), 1.0);
#else
    u_xlat16_26 = clamp(u_xlat16_26, 0.0, 1.0);
#endif
    u_xlat16_24 = u_xlat16_24 * u_xlat16_26;
    u_xlat16_24 = u_xlat16_24 * 0.5;
    u_xlat16_5.xyz = vec3(u_xlat16_24) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = min(u_xlat16_5.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_5.xyz;
    u_xlati0 = (u_xlatb1) ? 7 : u_xlati0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlati0<unity_VertexLightParams.x);
#else
    u_xlatb0 = u_xlati0<unity_VertexLightParams.x;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb1;
    vs_COLOR0.xyz = (bool(u_xlatb0)) ? u_xlat16_5.xyz : u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = in_COLOR0.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 unity_FogColor;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in mediump float vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_7;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = vs_COLOR0.xyz * u_xlat16_0.xyz + (-unity_FogColor.xyz);
    u_xlat16_7 = u_xlat16_0.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_7;
    SV_Target0.xyz = vec3(vs_TEXCOORD1) * u_xlat16_1.xyz + unity_FogColor.xyz;
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
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "POINT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "POINT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "POINT" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "POINT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "SPOT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "SPOT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "SPOT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "SPOT" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "SPOT" }
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
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "POINT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "POINT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "POINT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "FOG_LINEAR" "POINT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "FOG_LINEAR" "POINT" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "FOG_LINEAR" "POINT" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "FOG_LINEAR" "SPOT" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "FOG_LINEAR" "SPOT" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "FOG_LINEAR" "SPOT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "FOG_LINEAR" "SPOT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "FOG_LINEAR" "SPOT" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "FOG_LINEAR" "SPOT" }
""
}
}
}
}
}