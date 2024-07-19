//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/KriptoFX/PostEffects/WFX_Bloom" {
Properties {
_MainTex ("", 2D) = "" { }
_BaseTex ("", 2D) = "" { }
}
SubShader {
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 31843
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	mediump float _Threshold;
uniform 	mediump vec3 _Curve;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump float u_xlat16_4;
float u_xlat9;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(_PrefilterOffs) + vs_TEXCOORD0.xy;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = min(u_xlat10_0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_1.x = max(u_xlat0.z, u_xlat16_1.x);
    u_xlat16_1.yz = u_xlat16_1.xx + (-_Curve.xxyz.yx);
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(9.99999975e-06, 0.0));
    u_xlat16_4 = min(u_xlat16_1.y, _Curve.xxyz.z);
    u_xlat16_4 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_4 = u_xlat16_4 * _Curve.xxyz.w;
    u_xlat16_4 = max(u_xlat16_1.z, u_xlat16_4);
    u_xlat16_1.x = u_xlat16_4 / u_xlat16_1.x;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat9 = max(u_xlat0.y, u_xlat0.x);
    u_xlat2 = max(u_xlat0.z, 9.99999997e-07);
    u_xlat9 = max(u_xlat9, u_xlat2);
    u_xlat9 = u_xlat9 * 255.0;
    u_xlat9 = ceil(u_xlat9);
    u_xlat1.w = u_xlat9 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	mediump float _Threshold;
uniform 	mediump vec3 _Curve;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump float u_xlat16_4;
float u_xlat9;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(_PrefilterOffs) + vs_TEXCOORD0.xy;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = min(u_xlat10_0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_1.x = max(u_xlat0.z, u_xlat16_1.x);
    u_xlat16_1.yz = u_xlat16_1.xx + (-_Curve.xxyz.yx);
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(9.99999975e-06, 0.0));
    u_xlat16_4 = min(u_xlat16_1.y, _Curve.xxyz.z);
    u_xlat16_4 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_4 = u_xlat16_4 * _Curve.xxyz.w;
    u_xlat16_4 = max(u_xlat16_1.z, u_xlat16_4);
    u_xlat16_1.x = u_xlat16_4 / u_xlat16_1.x;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat9 = max(u_xlat0.y, u_xlat0.x);
    u_xlat2 = max(u_xlat0.z, 9.99999997e-07);
    u_xlat9 = max(u_xlat9, u_xlat2);
    u_xlat9 = u_xlat9 * 255.0;
    u_xlat9 = ceil(u_xlat9);
    u_xlat1.w = u_xlat9 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	mediump float _Threshold;
uniform 	mediump vec3 _Curve;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump float u_xlat16_4;
float u_xlat9;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(_PrefilterOffs) + vs_TEXCOORD0.xy;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = min(u_xlat10_0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_1.x = max(u_xlat0.z, u_xlat16_1.x);
    u_xlat16_1.yz = u_xlat16_1.xx + (-_Curve.xxyz.yx);
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(9.99999975e-06, 0.0));
    u_xlat16_4 = min(u_xlat16_1.y, _Curve.xxyz.z);
    u_xlat16_4 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_4 = u_xlat16_4 * _Curve.xxyz.w;
    u_xlat16_4 = max(u_xlat16_1.z, u_xlat16_4);
    u_xlat16_1.x = u_xlat16_4 / u_xlat16_1.x;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat9 = max(u_xlat0.y, u_xlat0.x);
    u_xlat2 = max(u_xlat0.z, 9.99999997e-07);
    u_xlat9 = max(u_xlat9, u_xlat2);
    u_xlat9 = u_xlat9 * 255.0;
    u_xlat9 = ceil(u_xlat9);
    u_xlat1.w = u_xlat9 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	mediump float _Threshold;
uniform 	mediump vec3 _Curve;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump float u_xlat16_4;
float u_xlat9;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(_PrefilterOffs) + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = min(u_xlat16_0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_1.x = max(u_xlat0.z, u_xlat16_1.x);
    u_xlat16_1.yz = u_xlat16_1.xx + (-_Curve.xxyz.yx);
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(9.99999975e-06, 0.0));
    u_xlat16_4 = min(u_xlat16_1.y, _Curve.xxyz.z);
    u_xlat16_4 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_4 = u_xlat16_4 * _Curve.xxyz.w;
    u_xlat16_4 = max(u_xlat16_1.z, u_xlat16_4);
    u_xlat16_1.x = u_xlat16_4 / u_xlat16_1.x;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat9 = max(u_xlat0.y, u_xlat0.x);
    u_xlat2 = max(u_xlat0.z, 9.99999997e-07);
    u_xlat9 = max(u_xlat9, u_xlat2);
    u_xlat9 = u_xlat9 * 255.0;
    u_xlat9 = ceil(u_xlat9);
    u_xlat1.w = u_xlat9 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	mediump float _Threshold;
uniform 	mediump vec3 _Curve;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump float u_xlat16_4;
float u_xlat9;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(_PrefilterOffs) + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = min(u_xlat16_0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_1.x = max(u_xlat0.z, u_xlat16_1.x);
    u_xlat16_1.yz = u_xlat16_1.xx + (-_Curve.xxyz.yx);
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(9.99999975e-06, 0.0));
    u_xlat16_4 = min(u_xlat16_1.y, _Curve.xxyz.z);
    u_xlat16_4 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_4 = u_xlat16_4 * _Curve.xxyz.w;
    u_xlat16_4 = max(u_xlat16_1.z, u_xlat16_4);
    u_xlat16_1.x = u_xlat16_4 / u_xlat16_1.x;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat9 = max(u_xlat0.y, u_xlat0.x);
    u_xlat2 = max(u_xlat0.z, 9.99999997e-07);
    u_xlat9 = max(u_xlat9, u_xlat2);
    u_xlat9 = u_xlat9 * 255.0;
    u_xlat9 = ceil(u_xlat9);
    u_xlat1.w = u_xlat9 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	mediump float _Threshold;
uniform 	mediump vec3 _Curve;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump float u_xlat16_4;
float u_xlat9;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(_PrefilterOffs) + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = min(u_xlat16_0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_1.x = max(u_xlat0.z, u_xlat16_1.x);
    u_xlat16_1.yz = u_xlat16_1.xx + (-_Curve.xxyz.yx);
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(9.99999975e-06, 0.0));
    u_xlat16_4 = min(u_xlat16_1.y, _Curve.xxyz.z);
    u_xlat16_4 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_4 = u_xlat16_4 * _Curve.xxyz.w;
    u_xlat16_4 = max(u_xlat16_1.z, u_xlat16_4);
    u_xlat16_1.x = u_xlat16_4 / u_xlat16_1.x;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat9 = max(u_xlat0.y, u_xlat0.x);
    u_xlat2 = max(u_xlat0.z, 9.99999997e-07);
    u_xlat9 = max(u_xlat9, u_xlat2);
    u_xlat9 = u_xlat9 * 255.0;
    u_xlat9 = ceil(u_xlat9);
    u_xlat1.w = u_xlat9 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	mediump float _Threshold;
uniform 	mediump vec3 _Curve;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump float u_xlat16_4;
float u_xlat9;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(_PrefilterOffs) + vs_TEXCOORD0.xy;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = min(u_xlat10_0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_1.x = max(u_xlat0.z, u_xlat16_1.x);
    u_xlat16_1.yz = u_xlat16_1.xx + (-_Curve.xxyz.yx);
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(9.99999975e-06, 0.0));
    u_xlat16_4 = min(u_xlat16_1.y, _Curve.xxyz.z);
    u_xlat16_4 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_4 = u_xlat16_4 * _Curve.xxyz.w;
    u_xlat16_4 = max(u_xlat16_1.z, u_xlat16_4);
    u_xlat16_1.x = u_xlat16_4 / u_xlat16_1.x;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat9 = max(u_xlat0.y, u_xlat0.x);
    u_xlat2 = max(u_xlat0.z, 9.99999997e-07);
    u_xlat9 = max(u_xlat9, u_xlat2);
    u_xlat9 = u_xlat9 * 255.0;
    u_xlat9 = ceil(u_xlat9);
    u_xlat1.w = u_xlat9 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	mediump float _Threshold;
uniform 	mediump vec3 _Curve;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump float u_xlat16_4;
float u_xlat9;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(_PrefilterOffs) + vs_TEXCOORD0.xy;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = min(u_xlat10_0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_1.x = max(u_xlat0.z, u_xlat16_1.x);
    u_xlat16_1.yz = u_xlat16_1.xx + (-_Curve.xxyz.yx);
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(9.99999975e-06, 0.0));
    u_xlat16_4 = min(u_xlat16_1.y, _Curve.xxyz.z);
    u_xlat16_4 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_4 = u_xlat16_4 * _Curve.xxyz.w;
    u_xlat16_4 = max(u_xlat16_1.z, u_xlat16_4);
    u_xlat16_1.x = u_xlat16_4 / u_xlat16_1.x;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat9 = max(u_xlat0.y, u_xlat0.x);
    u_xlat2 = max(u_xlat0.z, 9.99999997e-07);
    u_xlat9 = max(u_xlat9, u_xlat2);
    u_xlat9 = u_xlat9 * 255.0;
    u_xlat9 = ceil(u_xlat9);
    u_xlat1.w = u_xlat9 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	mediump float _Threshold;
uniform 	mediump vec3 _Curve;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump float u_xlat16_4;
float u_xlat9;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(_PrefilterOffs) + vs_TEXCOORD0.xy;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = min(u_xlat10_0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_1.x = max(u_xlat0.z, u_xlat16_1.x);
    u_xlat16_1.yz = u_xlat16_1.xx + (-_Curve.xxyz.yx);
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(9.99999975e-06, 0.0));
    u_xlat16_4 = min(u_xlat16_1.y, _Curve.xxyz.z);
    u_xlat16_4 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_4 = u_xlat16_4 * _Curve.xxyz.w;
    u_xlat16_4 = max(u_xlat16_1.z, u_xlat16_4);
    u_xlat16_1.x = u_xlat16_4 / u_xlat16_1.x;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat9 = max(u_xlat0.y, u_xlat0.x);
    u_xlat2 = max(u_xlat0.z, 9.99999997e-07);
    u_xlat9 = max(u_xlat9, u_xlat2);
    u_xlat9 = u_xlat9 * 255.0;
    u_xlat9 = ceil(u_xlat9);
    u_xlat1.w = u_xlat9 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	mediump float _Threshold;
uniform 	mediump vec3 _Curve;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump float u_xlat16_4;
float u_xlat9;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(_PrefilterOffs) + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = min(u_xlat16_0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_1.x = max(u_xlat0.z, u_xlat16_1.x);
    u_xlat16_1.yz = u_xlat16_1.xx + (-_Curve.xxyz.yx);
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(9.99999975e-06, 0.0));
    u_xlat16_4 = min(u_xlat16_1.y, _Curve.xxyz.z);
    u_xlat16_4 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_4 = u_xlat16_4 * _Curve.xxyz.w;
    u_xlat16_4 = max(u_xlat16_1.z, u_xlat16_4);
    u_xlat16_1.x = u_xlat16_4 / u_xlat16_1.x;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat9 = max(u_xlat0.y, u_xlat0.x);
    u_xlat2 = max(u_xlat0.z, 9.99999997e-07);
    u_xlat9 = max(u_xlat9, u_xlat2);
    u_xlat9 = u_xlat9 * 255.0;
    u_xlat9 = ceil(u_xlat9);
    u_xlat1.w = u_xlat9 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	mediump float _Threshold;
uniform 	mediump vec3 _Curve;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump float u_xlat16_4;
float u_xlat9;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(_PrefilterOffs) + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = min(u_xlat16_0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_1.x = max(u_xlat0.z, u_xlat16_1.x);
    u_xlat16_1.yz = u_xlat16_1.xx + (-_Curve.xxyz.yx);
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(9.99999975e-06, 0.0));
    u_xlat16_4 = min(u_xlat16_1.y, _Curve.xxyz.z);
    u_xlat16_4 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_4 = u_xlat16_4 * _Curve.xxyz.w;
    u_xlat16_4 = max(u_xlat16_1.z, u_xlat16_4);
    u_xlat16_1.x = u_xlat16_4 / u_xlat16_1.x;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat9 = max(u_xlat0.y, u_xlat0.x);
    u_xlat2 = max(u_xlat0.z, 9.99999997e-07);
    u_xlat9 = max(u_xlat9, u_xlat2);
    u_xlat9 = u_xlat9 * 255.0;
    u_xlat9 = ceil(u_xlat9);
    u_xlat1.w = u_xlat9 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	mediump float _Threshold;
uniform 	mediump vec3 _Curve;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump float u_xlat16_4;
float u_xlat9;
void main()
{
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(_PrefilterOffs) + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = min(u_xlat16_0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat16_1.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_1.x = max(u_xlat0.z, u_xlat16_1.x);
    u_xlat16_1.yz = u_xlat16_1.xx + (-_Curve.xxyz.yx);
    u_xlat16_1.xy = max(u_xlat16_1.xy, vec2(9.99999975e-06, 0.0));
    u_xlat16_4 = min(u_xlat16_1.y, _Curve.xxyz.z);
    u_xlat16_4 = u_xlat16_4 * u_xlat16_4;
    u_xlat16_4 = u_xlat16_4 * _Curve.xxyz.w;
    u_xlat16_4 = max(u_xlat16_1.z, u_xlat16_4);
    u_xlat16_1.x = u_xlat16_4 / u_xlat16_1.x;
    u_xlat16_1.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat9 = max(u_xlat0.y, u_xlat0.x);
    u_xlat2 = max(u_xlat0.z, 9.99999997e-07);
    u_xlat9 = max(u_xlat9, u_xlat2);
    u_xlat9 = u_xlat9 * 255.0;
    u_xlat9 = ceil(u_xlat9);
    u_xlat1.w = u_xlat9 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 93333
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	mediump float _Threshold;
uniform 	mediump vec3 _Curve;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_13;
float u_xlat30;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(_PrefilterOffs) + vs_TEXCOORD0.xyxy;
    u_xlat1 = (-_MainTex_TexelSize.xxxy) * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.zwzw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat1.zw).xyz;
    u_xlat16_3.xyz = min(u_xlat10_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_4.xyz = min(u_xlat10_2.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat0 = _MainTex_TexelSize.xxxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0;
    u_xlat16_5.xyz = min(u_xlat10_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_6.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_7.xyz = min(u_xlat10_0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_8.xyz = min(u_xlat10_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz + u_xlat16_8.xyz;
    u_xlat16_9.xyz = min(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_8.xyz, u_xlat16_4.xyz);
    u_xlat16_5.xyz = min(u_xlat16_8.xyz, u_xlat16_9.xyz);
    u_xlat16_5.xyz = (-u_xlat16_5.xyz) + u_xlat16_6.xyz;
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = min(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = max(u_xlat16_7.xyz, u_xlat16_3.xyz);
    u_xlat16_4.xyz = min(u_xlat16_7.xyz, u_xlat16_6.xyz);
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat16_3.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_3.x = max(u_xlat0.z, u_xlat16_3.x);
    u_xlat16_3.yz = u_xlat16_3.xx + (-_Curve.xxyz.yx);
    u_xlat16_3.xy = max(u_xlat16_3.xy, vec2(9.99999975e-06, 0.0));
    u_xlat16_13 = min(u_xlat16_3.y, _Curve.xxyz.z);
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_13 = u_xlat16_13 * _Curve.xxyz.w;
    u_xlat16_13 = max(u_xlat16_3.z, u_xlat16_13);
    u_xlat16_3.x = u_xlat16_13 / u_xlat16_3.x;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_3.xxx;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat30 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat30 = max(u_xlat30, u_xlat1.x);
    u_xlat30 = u_xlat30 * 255.0;
    u_xlat30 = ceil(u_xlat30);
    u_xlat1.w = u_xlat30 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	mediump float _Threshold;
uniform 	mediump vec3 _Curve;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_13;
float u_xlat30;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(_PrefilterOffs) + vs_TEXCOORD0.xyxy;
    u_xlat1 = (-_MainTex_TexelSize.xxxy) * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.zwzw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat1.zw).xyz;
    u_xlat16_3.xyz = min(u_xlat10_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_4.xyz = min(u_xlat10_2.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat0 = _MainTex_TexelSize.xxxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0;
    u_xlat16_5.xyz = min(u_xlat10_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_6.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_7.xyz = min(u_xlat10_0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_8.xyz = min(u_xlat10_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz + u_xlat16_8.xyz;
    u_xlat16_9.xyz = min(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_8.xyz, u_xlat16_4.xyz);
    u_xlat16_5.xyz = min(u_xlat16_8.xyz, u_xlat16_9.xyz);
    u_xlat16_5.xyz = (-u_xlat16_5.xyz) + u_xlat16_6.xyz;
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = min(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = max(u_xlat16_7.xyz, u_xlat16_3.xyz);
    u_xlat16_4.xyz = min(u_xlat16_7.xyz, u_xlat16_6.xyz);
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat16_3.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_3.x = max(u_xlat0.z, u_xlat16_3.x);
    u_xlat16_3.yz = u_xlat16_3.xx + (-_Curve.xxyz.yx);
    u_xlat16_3.xy = max(u_xlat16_3.xy, vec2(9.99999975e-06, 0.0));
    u_xlat16_13 = min(u_xlat16_3.y, _Curve.xxyz.z);
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_13 = u_xlat16_13 * _Curve.xxyz.w;
    u_xlat16_13 = max(u_xlat16_3.z, u_xlat16_13);
    u_xlat16_3.x = u_xlat16_13 / u_xlat16_3.x;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_3.xxx;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat30 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat30 = max(u_xlat30, u_xlat1.x);
    u_xlat30 = u_xlat30 * 255.0;
    u_xlat30 = ceil(u_xlat30);
    u_xlat1.w = u_xlat30 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	mediump float _Threshold;
uniform 	mediump vec3 _Curve;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_13;
float u_xlat30;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(_PrefilterOffs) + vs_TEXCOORD0.xyxy;
    u_xlat1 = (-_MainTex_TexelSize.xxxy) * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.zwzw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat1.zw).xyz;
    u_xlat16_3.xyz = min(u_xlat10_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_4.xyz = min(u_xlat10_2.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat0 = _MainTex_TexelSize.xxxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0;
    u_xlat16_5.xyz = min(u_xlat10_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_6.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_7.xyz = min(u_xlat10_0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_8.xyz = min(u_xlat10_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz + u_xlat16_8.xyz;
    u_xlat16_9.xyz = min(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_8.xyz, u_xlat16_4.xyz);
    u_xlat16_5.xyz = min(u_xlat16_8.xyz, u_xlat16_9.xyz);
    u_xlat16_5.xyz = (-u_xlat16_5.xyz) + u_xlat16_6.xyz;
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = min(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = max(u_xlat16_7.xyz, u_xlat16_3.xyz);
    u_xlat16_4.xyz = min(u_xlat16_7.xyz, u_xlat16_6.xyz);
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat16_3.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_3.x = max(u_xlat0.z, u_xlat16_3.x);
    u_xlat16_3.yz = u_xlat16_3.xx + (-_Curve.xxyz.yx);
    u_xlat16_3.xy = max(u_xlat16_3.xy, vec2(9.99999975e-06, 0.0));
    u_xlat16_13 = min(u_xlat16_3.y, _Curve.xxyz.z);
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_13 = u_xlat16_13 * _Curve.xxyz.w;
    u_xlat16_13 = max(u_xlat16_3.z, u_xlat16_13);
    u_xlat16_3.x = u_xlat16_13 / u_xlat16_3.x;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_3.xxx;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat30 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat30 = max(u_xlat30, u_xlat1.x);
    u_xlat30 = u_xlat30 * 255.0;
    u_xlat30 = ceil(u_xlat30);
    u_xlat1.w = u_xlat30 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	mediump float _Threshold;
uniform 	mediump vec3 _Curve;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_13;
float u_xlat30;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(_PrefilterOffs) + vs_TEXCOORD0.xyxy;
    u_xlat1 = (-_MainTex_TexelSize.xxxy) * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.zwzw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.zw).xyz;
    u_xlat16_3.xyz = min(u_xlat16_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_4.xyz = min(u_xlat16_2.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat0 = _MainTex_TexelSize.xxxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0;
    u_xlat16_5.xyz = min(u_xlat16_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_6.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_7.xyz = min(u_xlat16_0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_8.xyz = min(u_xlat16_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz + u_xlat16_8.xyz;
    u_xlat16_9.xyz = min(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_8.xyz, u_xlat16_4.xyz);
    u_xlat16_5.xyz = min(u_xlat16_8.xyz, u_xlat16_9.xyz);
    u_xlat16_5.xyz = (-u_xlat16_5.xyz) + u_xlat16_6.xyz;
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = min(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = max(u_xlat16_7.xyz, u_xlat16_3.xyz);
    u_xlat16_4.xyz = min(u_xlat16_7.xyz, u_xlat16_6.xyz);
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat16_3.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_3.x = max(u_xlat0.z, u_xlat16_3.x);
    u_xlat16_3.yz = u_xlat16_3.xx + (-_Curve.xxyz.yx);
    u_xlat16_3.xy = max(u_xlat16_3.xy, vec2(9.99999975e-06, 0.0));
    u_xlat16_13 = min(u_xlat16_3.y, _Curve.xxyz.z);
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_13 = u_xlat16_13 * _Curve.xxyz.w;
    u_xlat16_13 = max(u_xlat16_3.z, u_xlat16_13);
    u_xlat16_3.x = u_xlat16_13 / u_xlat16_3.x;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_3.xxx;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat30 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat30 = max(u_xlat30, u_xlat1.x);
    u_xlat30 = u_xlat30 * 255.0;
    u_xlat30 = ceil(u_xlat30);
    u_xlat1.w = u_xlat30 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	mediump float _Threshold;
uniform 	mediump vec3 _Curve;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_13;
float u_xlat30;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(_PrefilterOffs) + vs_TEXCOORD0.xyxy;
    u_xlat1 = (-_MainTex_TexelSize.xxxy) * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.zwzw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.zw).xyz;
    u_xlat16_3.xyz = min(u_xlat16_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_4.xyz = min(u_xlat16_2.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat0 = _MainTex_TexelSize.xxxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0;
    u_xlat16_5.xyz = min(u_xlat16_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_6.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_7.xyz = min(u_xlat16_0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_8.xyz = min(u_xlat16_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz + u_xlat16_8.xyz;
    u_xlat16_9.xyz = min(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_8.xyz, u_xlat16_4.xyz);
    u_xlat16_5.xyz = min(u_xlat16_8.xyz, u_xlat16_9.xyz);
    u_xlat16_5.xyz = (-u_xlat16_5.xyz) + u_xlat16_6.xyz;
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = min(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = max(u_xlat16_7.xyz, u_xlat16_3.xyz);
    u_xlat16_4.xyz = min(u_xlat16_7.xyz, u_xlat16_6.xyz);
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat16_3.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_3.x = max(u_xlat0.z, u_xlat16_3.x);
    u_xlat16_3.yz = u_xlat16_3.xx + (-_Curve.xxyz.yx);
    u_xlat16_3.xy = max(u_xlat16_3.xy, vec2(9.99999975e-06, 0.0));
    u_xlat16_13 = min(u_xlat16_3.y, _Curve.xxyz.z);
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_13 = u_xlat16_13 * _Curve.xxyz.w;
    u_xlat16_13 = max(u_xlat16_3.z, u_xlat16_13);
    u_xlat16_3.x = u_xlat16_13 / u_xlat16_3.x;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_3.xxx;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat30 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat30 = max(u_xlat30, u_xlat1.x);
    u_xlat30 = u_xlat30 * 255.0;
    u_xlat30 = ceil(u_xlat30);
    u_xlat1.w = u_xlat30 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	mediump float _Threshold;
uniform 	mediump vec3 _Curve;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_13;
float u_xlat30;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(_PrefilterOffs) + vs_TEXCOORD0.xyxy;
    u_xlat1 = (-_MainTex_TexelSize.xxxy) * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.zwzw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.zw).xyz;
    u_xlat16_3.xyz = min(u_xlat16_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_4.xyz = min(u_xlat16_2.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat0 = _MainTex_TexelSize.xxxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0;
    u_xlat16_5.xyz = min(u_xlat16_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_6.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_7.xyz = min(u_xlat16_0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_8.xyz = min(u_xlat16_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz + u_xlat16_8.xyz;
    u_xlat16_9.xyz = min(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_8.xyz, u_xlat16_4.xyz);
    u_xlat16_5.xyz = min(u_xlat16_8.xyz, u_xlat16_9.xyz);
    u_xlat16_5.xyz = (-u_xlat16_5.xyz) + u_xlat16_6.xyz;
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = min(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = max(u_xlat16_7.xyz, u_xlat16_3.xyz);
    u_xlat16_4.xyz = min(u_xlat16_7.xyz, u_xlat16_6.xyz);
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat16_3.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_3.x = max(u_xlat0.z, u_xlat16_3.x);
    u_xlat16_3.yz = u_xlat16_3.xx + (-_Curve.xxyz.yx);
    u_xlat16_3.xy = max(u_xlat16_3.xy, vec2(9.99999975e-06, 0.0));
    u_xlat16_13 = min(u_xlat16_3.y, _Curve.xxyz.z);
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_13 = u_xlat16_13 * _Curve.xxyz.w;
    u_xlat16_13 = max(u_xlat16_3.z, u_xlat16_13);
    u_xlat16_3.x = u_xlat16_13 / u_xlat16_3.x;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_3.xxx;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat30 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat30 = max(u_xlat30, u_xlat1.x);
    u_xlat30 = u_xlat30 * 255.0;
    u_xlat30 = ceil(u_xlat30);
    u_xlat1.w = u_xlat30 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	mediump float _Threshold;
uniform 	mediump vec3 _Curve;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_13;
float u_xlat30;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(_PrefilterOffs) + vs_TEXCOORD0.xyxy;
    u_xlat1 = (-_MainTex_TexelSize.xxxy) * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.zwzw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat1.zw).xyz;
    u_xlat16_3.xyz = min(u_xlat10_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_4.xyz = min(u_xlat10_2.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat0 = _MainTex_TexelSize.xxxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0;
    u_xlat16_5.xyz = min(u_xlat10_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_6.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_7.xyz = min(u_xlat10_0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_8.xyz = min(u_xlat10_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz + u_xlat16_8.xyz;
    u_xlat16_9.xyz = min(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_8.xyz, u_xlat16_4.xyz);
    u_xlat16_5.xyz = min(u_xlat16_8.xyz, u_xlat16_9.xyz);
    u_xlat16_5.xyz = (-u_xlat16_5.xyz) + u_xlat16_6.xyz;
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = min(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = max(u_xlat16_7.xyz, u_xlat16_3.xyz);
    u_xlat16_4.xyz = min(u_xlat16_7.xyz, u_xlat16_6.xyz);
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat16_3.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_3.x = max(u_xlat0.z, u_xlat16_3.x);
    u_xlat16_3.yz = u_xlat16_3.xx + (-_Curve.xxyz.yx);
    u_xlat16_3.xy = max(u_xlat16_3.xy, vec2(9.99999975e-06, 0.0));
    u_xlat16_13 = min(u_xlat16_3.y, _Curve.xxyz.z);
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_13 = u_xlat16_13 * _Curve.xxyz.w;
    u_xlat16_13 = max(u_xlat16_3.z, u_xlat16_13);
    u_xlat16_3.x = u_xlat16_13 / u_xlat16_3.x;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_3.xxx;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat30 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat30 = max(u_xlat30, u_xlat1.x);
    u_xlat30 = u_xlat30 * 255.0;
    u_xlat30 = ceil(u_xlat30);
    u_xlat1.w = u_xlat30 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	mediump float _Threshold;
uniform 	mediump vec3 _Curve;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_13;
float u_xlat30;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(_PrefilterOffs) + vs_TEXCOORD0.xyxy;
    u_xlat1 = (-_MainTex_TexelSize.xxxy) * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.zwzw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat1.zw).xyz;
    u_xlat16_3.xyz = min(u_xlat10_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_4.xyz = min(u_xlat10_2.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat0 = _MainTex_TexelSize.xxxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0;
    u_xlat16_5.xyz = min(u_xlat10_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_6.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_7.xyz = min(u_xlat10_0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_8.xyz = min(u_xlat10_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz + u_xlat16_8.xyz;
    u_xlat16_9.xyz = min(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_8.xyz, u_xlat16_4.xyz);
    u_xlat16_5.xyz = min(u_xlat16_8.xyz, u_xlat16_9.xyz);
    u_xlat16_5.xyz = (-u_xlat16_5.xyz) + u_xlat16_6.xyz;
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = min(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = max(u_xlat16_7.xyz, u_xlat16_3.xyz);
    u_xlat16_4.xyz = min(u_xlat16_7.xyz, u_xlat16_6.xyz);
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat16_3.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_3.x = max(u_xlat0.z, u_xlat16_3.x);
    u_xlat16_3.yz = u_xlat16_3.xx + (-_Curve.xxyz.yx);
    u_xlat16_3.xy = max(u_xlat16_3.xy, vec2(9.99999975e-06, 0.0));
    u_xlat16_13 = min(u_xlat16_3.y, _Curve.xxyz.z);
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_13 = u_xlat16_13 * _Curve.xxyz.w;
    u_xlat16_13 = max(u_xlat16_3.z, u_xlat16_13);
    u_xlat16_3.x = u_xlat16_13 / u_xlat16_3.x;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_3.xxx;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat30 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat30 = max(u_xlat30, u_xlat1.x);
    u_xlat30 = u_xlat30 * 255.0;
    u_xlat30 = ceil(u_xlat30);
    u_xlat1.w = u_xlat30 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	mediump float _Threshold;
uniform 	mediump vec3 _Curve;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_13;
float u_xlat30;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(_PrefilterOffs) + vs_TEXCOORD0.xyxy;
    u_xlat1 = (-_MainTex_TexelSize.xxxy) * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.zwzw;
    u_xlat10_2.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat1.zw).xyz;
    u_xlat16_3.xyz = min(u_xlat10_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_4.xyz = min(u_xlat10_2.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat0 = _MainTex_TexelSize.xxxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0;
    u_xlat16_5.xyz = min(u_xlat10_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_6.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat10_1.xyz = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_7.xyz = min(u_xlat10_0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_8.xyz = min(u_xlat10_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz + u_xlat16_8.xyz;
    u_xlat16_9.xyz = min(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_8.xyz, u_xlat16_4.xyz);
    u_xlat16_5.xyz = min(u_xlat16_8.xyz, u_xlat16_9.xyz);
    u_xlat16_5.xyz = (-u_xlat16_5.xyz) + u_xlat16_6.xyz;
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = min(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = max(u_xlat16_7.xyz, u_xlat16_3.xyz);
    u_xlat16_4.xyz = min(u_xlat16_7.xyz, u_xlat16_6.xyz);
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat16_3.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_3.x = max(u_xlat0.z, u_xlat16_3.x);
    u_xlat16_3.yz = u_xlat16_3.xx + (-_Curve.xxyz.yx);
    u_xlat16_3.xy = max(u_xlat16_3.xy, vec2(9.99999975e-06, 0.0));
    u_xlat16_13 = min(u_xlat16_3.y, _Curve.xxyz.z);
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_13 = u_xlat16_13 * _Curve.xxyz.w;
    u_xlat16_13 = max(u_xlat16_3.z, u_xlat16_13);
    u_xlat16_3.x = u_xlat16_13 / u_xlat16_3.x;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_3.xxx;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat30 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat30 = max(u_xlat30, u_xlat1.x);
    u_xlat30 = u_xlat30 * 255.0;
    u_xlat30 = ceil(u_xlat30);
    u_xlat1.w = u_xlat30 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	mediump float _Threshold;
uniform 	mediump vec3 _Curve;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_13;
float u_xlat30;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(_PrefilterOffs) + vs_TEXCOORD0.xyxy;
    u_xlat1 = (-_MainTex_TexelSize.xxxy) * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.zwzw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.zw).xyz;
    u_xlat16_3.xyz = min(u_xlat16_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_4.xyz = min(u_xlat16_2.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat0 = _MainTex_TexelSize.xxxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0;
    u_xlat16_5.xyz = min(u_xlat16_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_6.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_7.xyz = min(u_xlat16_0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_8.xyz = min(u_xlat16_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz + u_xlat16_8.xyz;
    u_xlat16_9.xyz = min(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_8.xyz, u_xlat16_4.xyz);
    u_xlat16_5.xyz = min(u_xlat16_8.xyz, u_xlat16_9.xyz);
    u_xlat16_5.xyz = (-u_xlat16_5.xyz) + u_xlat16_6.xyz;
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = min(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = max(u_xlat16_7.xyz, u_xlat16_3.xyz);
    u_xlat16_4.xyz = min(u_xlat16_7.xyz, u_xlat16_6.xyz);
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat16_3.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_3.x = max(u_xlat0.z, u_xlat16_3.x);
    u_xlat16_3.yz = u_xlat16_3.xx + (-_Curve.xxyz.yx);
    u_xlat16_3.xy = max(u_xlat16_3.xy, vec2(9.99999975e-06, 0.0));
    u_xlat16_13 = min(u_xlat16_3.y, _Curve.xxyz.z);
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_13 = u_xlat16_13 * _Curve.xxyz.w;
    u_xlat16_13 = max(u_xlat16_3.z, u_xlat16_13);
    u_xlat16_3.x = u_xlat16_13 / u_xlat16_3.x;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_3.xxx;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat30 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat30 = max(u_xlat30, u_xlat1.x);
    u_xlat30 = u_xlat30 * 255.0;
    u_xlat30 = ceil(u_xlat30);
    u_xlat1.w = u_xlat30 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	mediump float _Threshold;
uniform 	mediump vec3 _Curve;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_13;
float u_xlat30;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(_PrefilterOffs) + vs_TEXCOORD0.xyxy;
    u_xlat1 = (-_MainTex_TexelSize.xxxy) * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.zwzw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.zw).xyz;
    u_xlat16_3.xyz = min(u_xlat16_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_4.xyz = min(u_xlat16_2.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat0 = _MainTex_TexelSize.xxxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0;
    u_xlat16_5.xyz = min(u_xlat16_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_6.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_7.xyz = min(u_xlat16_0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_8.xyz = min(u_xlat16_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz + u_xlat16_8.xyz;
    u_xlat16_9.xyz = min(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_8.xyz, u_xlat16_4.xyz);
    u_xlat16_5.xyz = min(u_xlat16_8.xyz, u_xlat16_9.xyz);
    u_xlat16_5.xyz = (-u_xlat16_5.xyz) + u_xlat16_6.xyz;
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = min(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = max(u_xlat16_7.xyz, u_xlat16_3.xyz);
    u_xlat16_4.xyz = min(u_xlat16_7.xyz, u_xlat16_6.xyz);
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat16_3.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_3.x = max(u_xlat0.z, u_xlat16_3.x);
    u_xlat16_3.yz = u_xlat16_3.xx + (-_Curve.xxyz.yx);
    u_xlat16_3.xy = max(u_xlat16_3.xy, vec2(9.99999975e-06, 0.0));
    u_xlat16_13 = min(u_xlat16_3.y, _Curve.xxyz.z);
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_13 = u_xlat16_13 * _Curve.xxyz.w;
    u_xlat16_13 = max(u_xlat16_3.z, u_xlat16_13);
    u_xlat16_3.x = u_xlat16_13 / u_xlat16_3.x;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_3.xxx;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat30 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat30 = max(u_xlat30, u_xlat1.x);
    u_xlat30 = u_xlat30 * 255.0;
    u_xlat30 = ceil(u_xlat30);
    u_xlat1.w = u_xlat30 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _PrefilterOffs;
uniform 	mediump float _Threshold;
uniform 	mediump vec3 _Curve;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump float u_xlat16_13;
float u_xlat30;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(_PrefilterOffs) + vs_TEXCOORD0.xyxy;
    u_xlat1 = (-_MainTex_TexelSize.xxxy) * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0.zwzw;
    u_xlat16_2.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat1.zw).xyz;
    u_xlat16_3.xyz = min(u_xlat16_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_4.xyz = min(u_xlat16_2.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat0 = _MainTex_TexelSize.xxxy * vec4(1.0, 0.0, 0.0, 1.0) + u_xlat0;
    u_xlat16_5.xyz = min(u_xlat16_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_6.xyz = u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat16_0.xyz = texture(_MainTex, u_xlat0.zw).xyz;
    u_xlat16_7.xyz = min(u_xlat16_0.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_8.xyz = min(u_xlat16_1.xyz, vec3(65000.0, 65000.0, 65000.0));
    u_xlat16_6.xyz = u_xlat16_6.xyz + u_xlat16_8.xyz;
    u_xlat16_9.xyz = min(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_4.xyz, u_xlat16_5.xyz);
    u_xlat16_4.xyz = max(u_xlat16_8.xyz, u_xlat16_4.xyz);
    u_xlat16_5.xyz = min(u_xlat16_8.xyz, u_xlat16_9.xyz);
    u_xlat16_5.xyz = (-u_xlat16_5.xyz) + u_xlat16_6.xyz;
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_5.xyz = u_xlat16_7.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = min(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, u_xlat16_4.xyz);
    u_xlat16_3.xyz = max(u_xlat16_7.xyz, u_xlat16_3.xyz);
    u_xlat16_4.xyz = min(u_xlat16_7.xyz, u_xlat16_6.xyz);
    u_xlat16_4.xyz = (-u_xlat16_4.xyz) + u_xlat16_5.xyz;
    u_xlat16_3.xyz = (-u_xlat16_3.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat0.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.x = max(u_xlat0.y, u_xlat0.x);
    u_xlat16_3.x = max(u_xlat0.z, u_xlat16_3.x);
    u_xlat16_3.yz = u_xlat16_3.xx + (-_Curve.xxyz.yx);
    u_xlat16_3.xy = max(u_xlat16_3.xy, vec2(9.99999975e-06, 0.0));
    u_xlat16_13 = min(u_xlat16_3.y, _Curve.xxyz.z);
    u_xlat16_13 = u_xlat16_13 * u_xlat16_13;
    u_xlat16_13 = u_xlat16_13 * _Curve.xxyz.w;
    u_xlat16_13 = max(u_xlat16_3.z, u_xlat16_13);
    u_xlat16_3.x = u_xlat16_13 / u_xlat16_3.x;
    u_xlat16_3.xyz = u_xlat0.xyz * u_xlat16_3.xxx;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat30 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat30 = max(u_xlat30, u_xlat1.x);
    u_xlat30 = u_xlat30 * 255.0;
    u_xlat30 = ceil(u_xlat30);
    u_xlat1.w = u_xlat30 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 132164
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat0.zw);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_3.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_3.xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_2 = texture2D(_MainTex, u_xlat1.xy);
    u_xlat10_1 = texture2D(_MainTex, u_xlat1.zw);
    u_xlat16_3.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_4.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.03125, 0.03125, 0.03125);
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat15 = max(u_xlat15, u_xlat1.x);
    u_xlat15 = u_xlat15 * 255.0;
    u_xlat15 = ceil(u_xlat15);
    u_xlat1.w = u_xlat15 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat0.zw);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_3.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_3.xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_2 = texture2D(_MainTex, u_xlat1.xy);
    u_xlat10_1 = texture2D(_MainTex, u_xlat1.zw);
    u_xlat16_3.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_4.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.03125, 0.03125, 0.03125);
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat15 = max(u_xlat15, u_xlat1.x);
    u_xlat15 = u_xlat15 * 255.0;
    u_xlat15 = ceil(u_xlat15);
    u_xlat1.w = u_xlat15 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat0.zw);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_3.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_3.xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_2 = texture2D(_MainTex, u_xlat1.xy);
    u_xlat10_1 = texture2D(_MainTex, u_xlat1.zw);
    u_xlat16_3.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_4.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.03125, 0.03125, 0.03125);
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat15 = max(u_xlat15, u_xlat1.x);
    u_xlat15 = u_xlat15 * 255.0;
    u_xlat15 = ceil(u_xlat15);
    u_xlat1.w = u_xlat15 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_1 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_3.xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_2 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_1 = texture(_MainTex, u_xlat1.zw);
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.03125, 0.03125, 0.03125);
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat15 = max(u_xlat15, u_xlat1.x);
    u_xlat15 = u_xlat15 * 255.0;
    u_xlat15 = ceil(u_xlat15);
    u_xlat1.w = u_xlat15 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_1 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_3.xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_2 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_1 = texture(_MainTex, u_xlat1.zw);
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.03125, 0.03125, 0.03125);
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat15 = max(u_xlat15, u_xlat1.x);
    u_xlat15 = u_xlat15 * 255.0;
    u_xlat15 = ceil(u_xlat15);
    u_xlat1.w = u_xlat15 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_1 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_3.xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_2 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_1 = texture(_MainTex, u_xlat1.zw);
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.03125, 0.03125, 0.03125);
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat15 = max(u_xlat15, u_xlat1.x);
    u_xlat15 = u_xlat15 * 255.0;
    u_xlat15 = ceil(u_xlat15);
    u_xlat1.w = u_xlat15 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 228147
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
mediump float u_xlat16_17;
mediump float u_xlat16_18;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat0.zw);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat16_3.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat16_17 = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_17 = max(u_xlat16_3.z, u_xlat16_17);
    u_xlat16_17 = u_xlat16_17 + 1.0;
    u_xlat16_17 = float(1.0) / u_xlat16_17;
    u_xlat16_3.xyz = vec3(u_xlat16_17) * u_xlat16_3.xyz;
    u_xlat16_18 = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_18 = max(u_xlat16_2.z, u_xlat16_18);
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_18) + u_xlat16_3.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat16_4.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat16_18 = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_18 = max(u_xlat16_4.z, u_xlat16_18);
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat16_18 = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_18 = max(u_xlat16_3.z, u_xlat16_18);
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat16_17 = float(1.0) / u_xlat16_17;
    u_xlat16_2.xyz = vec3(u_xlat16_17) * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat15 = max(u_xlat15, u_xlat1.x);
    u_xlat15 = u_xlat15 * 255.0;
    u_xlat15 = ceil(u_xlat15);
    u_xlat1.w = u_xlat15 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
mediump float u_xlat16_17;
mediump float u_xlat16_18;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat0.zw);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat16_3.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat16_17 = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_17 = max(u_xlat16_3.z, u_xlat16_17);
    u_xlat16_17 = u_xlat16_17 + 1.0;
    u_xlat16_17 = float(1.0) / u_xlat16_17;
    u_xlat16_3.xyz = vec3(u_xlat16_17) * u_xlat16_3.xyz;
    u_xlat16_18 = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_18 = max(u_xlat16_2.z, u_xlat16_18);
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_18) + u_xlat16_3.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat16_4.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat16_18 = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_18 = max(u_xlat16_4.z, u_xlat16_18);
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat16_18 = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_18 = max(u_xlat16_3.z, u_xlat16_18);
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat16_17 = float(1.0) / u_xlat16_17;
    u_xlat16_2.xyz = vec3(u_xlat16_17) * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat15 = max(u_xlat15, u_xlat1.x);
    u_xlat15 = u_xlat15 * 255.0;
    u_xlat15 = ceil(u_xlat15);
    u_xlat1.w = u_xlat15 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
mediump float u_xlat16_17;
mediump float u_xlat16_18;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat0.zw);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat16_3.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat16_17 = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_17 = max(u_xlat16_3.z, u_xlat16_17);
    u_xlat16_17 = u_xlat16_17 + 1.0;
    u_xlat16_17 = float(1.0) / u_xlat16_17;
    u_xlat16_3.xyz = vec3(u_xlat16_17) * u_xlat16_3.xyz;
    u_xlat16_18 = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_18 = max(u_xlat16_2.z, u_xlat16_18);
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_18) + u_xlat16_3.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat16_4.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat16_18 = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_18 = max(u_xlat16_4.z, u_xlat16_18);
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat16_18 = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_18 = max(u_xlat16_3.z, u_xlat16_18);
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat16_17 = float(1.0) / u_xlat16_17;
    u_xlat16_2.xyz = vec3(u_xlat16_17) * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat15 = max(u_xlat15, u_xlat1.x);
    u_xlat15 = u_xlat15 * 255.0;
    u_xlat15 = ceil(u_xlat15);
    u_xlat1.w = u_xlat15 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
mediump float u_xlat16_17;
mediump float u_xlat16_18;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_1 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat16_17 = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_17 = max(u_xlat16_3.z, u_xlat16_17);
    u_xlat16_17 = u_xlat16_17 + 1.0;
    u_xlat16_17 = float(1.0) / u_xlat16_17;
    u_xlat16_3.xyz = vec3(u_xlat16_17) * u_xlat16_3.xyz;
    u_xlat16_18 = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_18 = max(u_xlat16_2.z, u_xlat16_18);
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_18) + u_xlat16_3.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat16_4.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat16_18 = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_18 = max(u_xlat16_4.z, u_xlat16_18);
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat16_18 = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_18 = max(u_xlat16_3.z, u_xlat16_18);
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat16_17 = float(1.0) / u_xlat16_17;
    u_xlat16_2.xyz = vec3(u_xlat16_17) * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat15 = max(u_xlat15, u_xlat1.x);
    u_xlat15 = u_xlat15 * 255.0;
    u_xlat15 = ceil(u_xlat15);
    u_xlat1.w = u_xlat15 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
mediump float u_xlat16_17;
mediump float u_xlat16_18;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_1 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat16_17 = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_17 = max(u_xlat16_3.z, u_xlat16_17);
    u_xlat16_17 = u_xlat16_17 + 1.0;
    u_xlat16_17 = float(1.0) / u_xlat16_17;
    u_xlat16_3.xyz = vec3(u_xlat16_17) * u_xlat16_3.xyz;
    u_xlat16_18 = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_18 = max(u_xlat16_2.z, u_xlat16_18);
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_18) + u_xlat16_3.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat16_4.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat16_18 = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_18 = max(u_xlat16_4.z, u_xlat16_18);
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat16_18 = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_18 = max(u_xlat16_3.z, u_xlat16_18);
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat16_17 = float(1.0) / u_xlat16_17;
    u_xlat16_2.xyz = vec3(u_xlat16_17) * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat15 = max(u_xlat15, u_xlat1.x);
    u_xlat15 = u_xlat15 * 255.0;
    u_xlat15 = ceil(u_xlat15);
    u_xlat1.w = u_xlat15 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
mediump float u_xlat16_17;
mediump float u_xlat16_18;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_1 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat16_17 = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_17 = max(u_xlat16_3.z, u_xlat16_17);
    u_xlat16_17 = u_xlat16_17 + 1.0;
    u_xlat16_17 = float(1.0) / u_xlat16_17;
    u_xlat16_3.xyz = vec3(u_xlat16_17) * u_xlat16_3.xyz;
    u_xlat16_18 = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_18 = max(u_xlat16_2.z, u_xlat16_18);
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_18) + u_xlat16_3.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_1 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat16_4.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat16_18 = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_18 = max(u_xlat16_4.z, u_xlat16_18);
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_4.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat16_18 = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_18 = max(u_xlat16_3.z, u_xlat16_18);
    u_xlat16_18 = u_xlat16_18 + 1.0;
    u_xlat16_18 = float(1.0) / u_xlat16_18;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(u_xlat16_18) + u_xlat16_2.xyz;
    u_xlat16_17 = u_xlat16_17 + u_xlat16_18;
    u_xlat16_17 = float(1.0) / u_xlat16_17;
    u_xlat16_2.xyz = vec3(u_xlat16_17) * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat15 = max(u_xlat15, u_xlat1.x);
    u_xlat15 = u_xlat15 * 255.0;
    u_xlat15 = ceil(u_xlat15);
    u_xlat1.w = u_xlat15 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 315113
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat0.zw);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_3.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_3.xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_2 = texture2D(_MainTex, u_xlat1.xy);
    u_xlat10_1 = texture2D(_MainTex, u_xlat1.zw);
    u_xlat16_3.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_4.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.03125, 0.03125, 0.03125);
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat15 = max(u_xlat15, u_xlat1.x);
    u_xlat15 = u_xlat15 * 255.0;
    u_xlat15 = ceil(u_xlat15);
    u_xlat1.w = u_xlat15 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat0.zw);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_3.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_3.xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_2 = texture2D(_MainTex, u_xlat1.xy);
    u_xlat10_1 = texture2D(_MainTex, u_xlat1.zw);
    u_xlat16_3.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_4.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.03125, 0.03125, 0.03125);
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat15 = max(u_xlat15, u_xlat1.x);
    u_xlat15 = u_xlat15 * 255.0;
    u_xlat15 = ceil(u_xlat15);
    u_xlat1.w = u_xlat15 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying mediump vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat0.zw);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_3.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_3.xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_2 = texture2D(_MainTex, u_xlat1.xy);
    u_xlat10_1 = texture2D(_MainTex, u_xlat1.zw);
    u_xlat16_3.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_4.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.03125, 0.03125, 0.03125);
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat15 = max(u_xlat15, u_xlat1.x);
    u_xlat15 = u_xlat15 * 255.0;
    u_xlat15 = ceil(u_xlat15);
    u_xlat1.w = u_xlat15 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_1 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_3.xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_2 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_1 = texture(_MainTex, u_xlat1.zw);
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.03125, 0.03125, 0.03125);
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat15 = max(u_xlat15, u_xlat1.x);
    u_xlat15 = u_xlat15 * 255.0;
    u_xlat15 = ceil(u_xlat15);
    u_xlat1.w = u_xlat15 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_1 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_3.xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_2 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_1 = texture(_MainTex, u_xlat1.zw);
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.03125, 0.03125, 0.03125);
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat15 = max(u_xlat15, u_xlat1.x);
    u_xlat15 = u_xlat15 * 255.0;
    u_xlat15 = ceil(u_xlat15);
    u_xlat1.w = u_xlat15 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out mediump vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD0.xy = u_xlat0.xy;
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
uniform 	vec2 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, -1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_1 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_3.xyz;
    u_xlat1 = _MainTex_TexelSize.xyxy * vec4(-1.0, 1.0, 1.0, 1.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_2 = texture(_MainTex, u_xlat1.xy);
    u_xlat16_1 = texture(_MainTex, u_xlat1.zw);
    u_xlat16_3.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.03125, 0.03125, 0.03125);
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat15 = max(u_xlat15, u_xlat1.x);
    u_xlat15 = u_xlat15 * 255.0;
    u_xlat15 = ceil(u_xlat15);
    u_xlat1.w = u_xlat15 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 384740
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform lowp sampler2D _BaseTex;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat1.x = _SampleScale * 0.5;
    u_xlat2 = u_xlat0.xyzy * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwzw * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat2.zw);
    u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy);
    u_xlat16_3.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_4.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat1.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_4.xyz;
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_4.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat10_0 = texture2D(_BaseTex, vs_TEXCOORD1.xy);
    u_xlat16_4.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat15 = max(u_xlat15, u_xlat1.x);
    u_xlat15 = u_xlat15 * 255.0;
    u_xlat15 = ceil(u_xlat15);
    u_xlat1.w = u_xlat15 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform lowp sampler2D _BaseTex;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat1.x = _SampleScale * 0.5;
    u_xlat2 = u_xlat0.xyzy * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwzw * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat2.zw);
    u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy);
    u_xlat16_3.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_4.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat1.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_4.xyz;
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_4.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat10_0 = texture2D(_BaseTex, vs_TEXCOORD1.xy);
    u_xlat16_4.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat15 = max(u_xlat15, u_xlat1.x);
    u_xlat15 = u_xlat15 * 255.0;
    u_xlat15 = ceil(u_xlat15);
    u_xlat1.w = u_xlat15 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform lowp sampler2D _BaseTex;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat1.x = _SampleScale * 0.5;
    u_xlat2 = u_xlat0.xyzy * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwzw * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat2.zw);
    u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy);
    u_xlat16_3.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_4.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat1.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_4.xyz;
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_4.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat10_0 = texture2D(_BaseTex, vs_TEXCOORD1.xy);
    u_xlat16_4.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat15 = max(u_xlat15, u_xlat1.x);
    u_xlat15 = u_xlat15 * 255.0;
    u_xlat15 = ceil(u_xlat15);
    u_xlat1.w = u_xlat15 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
UNITY_LOCATION(0) uniform mediump sampler2D _BaseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat1.x = _SampleScale * 0.5;
    u_xlat2 = u_xlat0.xyzy * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwzw * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat16_1 = texture(_MainTex, u_xlat2.zw);
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat16_4.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat1.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_4.xyz;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_0 = texture(_BaseTex, vs_TEXCOORD1.xy);
    u_xlat16_4.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat15 = max(u_xlat15, u_xlat1.x);
    u_xlat15 = u_xlat15 * 255.0;
    u_xlat15 = ceil(u_xlat15);
    u_xlat1.w = u_xlat15 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
UNITY_LOCATION(0) uniform mediump sampler2D _BaseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat1.x = _SampleScale * 0.5;
    u_xlat2 = u_xlat0.xyzy * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwzw * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat16_1 = texture(_MainTex, u_xlat2.zw);
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat16_4.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat1.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_4.xyz;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_0 = texture(_BaseTex, vs_TEXCOORD1.xy);
    u_xlat16_4.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat15 = max(u_xlat15, u_xlat1.x);
    u_xlat15 = u_xlat15 * 255.0;
    u_xlat15 = ceil(u_xlat15);
    u_xlat1.w = u_xlat15 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
UNITY_LOCATION(0) uniform mediump sampler2D _BaseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
float u_xlat15;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat1.x = _SampleScale * 0.5;
    u_xlat2 = u_xlat0.xyzy * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwzw * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat16_1 = texture(_MainTex, u_xlat2.zw);
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat16_4.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat1.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_4.xyz;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_0 = texture(_BaseTex, vs_TEXCOORD1.xy);
    u_xlat16_4.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_3.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat15 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat15 = max(u_xlat15, u_xlat1.x);
    u_xlat15 = u_xlat15 * 255.0;
    u_xlat15 = ceil(u_xlat15);
    u_xlat1.w = u_xlat15 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 445521
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform lowp sampler2D _BaseTex;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat24;
void main()
{
    u_xlat0.x = 1.0;
    u_xlat0.z = _SampleScale;
    u_xlat0 = u_xlat0.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.0);
    u_xlat1.x = _SampleScale;
    u_xlat2 = (-u_xlat0.xywy) * u_xlat1.xxwx + vs_TEXCOORD0.xyxy;
    u_xlat10_3 = texture2D(_MainTex, u_xlat2.zw);
    u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy);
    u_xlat16_4.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_5.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(16.0, 16.0, 16.0);
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3.xy = (-u_xlat0.zy) * u_xlat1.zx + vs_TEXCOORD0.xy;
    u_xlat10_3 = texture2D(_MainTex, u_xlat3.xy);
    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3 = u_xlat0.zwxw * u_xlat1.zwxw + vs_TEXCOORD0.xyxy;
    u_xlat4 = u_xlat0.zywy * u_xlat1.zxwx + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_5.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat10_0 = texture2D(_MainTex, u_xlat3.xy);
    u_xlat10_1 = texture2D(_MainTex, u_xlat3.zw);
    u_xlat16_6.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_7.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(16.0, 16.0, 16.0) + u_xlat2.xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_7.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(32.0, 32.0, 32.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat10_1 = texture2D(_MainTex, u_xlat4.xy);
    u_xlat10_2 = texture2D(_MainTex, u_xlat4.zw);
    u_xlat16_6.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_7.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(0.0625, 0.0625, 0.0625);
    u_xlat10_0 = texture2D(_BaseTex, vs_TEXCOORD1.xy);
    u_xlat16_6.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat24 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat24 = max(u_xlat24, u_xlat1.x);
    u_xlat24 = u_xlat24 * 255.0;
    u_xlat24 = ceil(u_xlat24);
    u_xlat1.w = u_xlat24 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform lowp sampler2D _BaseTex;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat24;
void main()
{
    u_xlat0.x = 1.0;
    u_xlat0.z = _SampleScale;
    u_xlat0 = u_xlat0.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.0);
    u_xlat1.x = _SampleScale;
    u_xlat2 = (-u_xlat0.xywy) * u_xlat1.xxwx + vs_TEXCOORD0.xyxy;
    u_xlat10_3 = texture2D(_MainTex, u_xlat2.zw);
    u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy);
    u_xlat16_4.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_5.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(16.0, 16.0, 16.0);
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3.xy = (-u_xlat0.zy) * u_xlat1.zx + vs_TEXCOORD0.xy;
    u_xlat10_3 = texture2D(_MainTex, u_xlat3.xy);
    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3 = u_xlat0.zwxw * u_xlat1.zwxw + vs_TEXCOORD0.xyxy;
    u_xlat4 = u_xlat0.zywy * u_xlat1.zxwx + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_5.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat10_0 = texture2D(_MainTex, u_xlat3.xy);
    u_xlat10_1 = texture2D(_MainTex, u_xlat3.zw);
    u_xlat16_6.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_7.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(16.0, 16.0, 16.0) + u_xlat2.xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_7.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(32.0, 32.0, 32.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat10_1 = texture2D(_MainTex, u_xlat4.xy);
    u_xlat10_2 = texture2D(_MainTex, u_xlat4.zw);
    u_xlat16_6.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_7.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(0.0625, 0.0625, 0.0625);
    u_xlat10_0 = texture2D(_BaseTex, vs_TEXCOORD1.xy);
    u_xlat16_6.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat24 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat24 = max(u_xlat24, u_xlat1.x);
    u_xlat24 = u_xlat24 * 255.0;
    u_xlat24 = ceil(u_xlat24);
    u_xlat1.w = u_xlat24 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform lowp sampler2D _BaseTex;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat24;
void main()
{
    u_xlat0.x = 1.0;
    u_xlat0.z = _SampleScale;
    u_xlat0 = u_xlat0.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.0);
    u_xlat1.x = _SampleScale;
    u_xlat2 = (-u_xlat0.xywy) * u_xlat1.xxwx + vs_TEXCOORD0.xyxy;
    u_xlat10_3 = texture2D(_MainTex, u_xlat2.zw);
    u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy);
    u_xlat16_4.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_5.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(16.0, 16.0, 16.0);
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3.xy = (-u_xlat0.zy) * u_xlat1.zx + vs_TEXCOORD0.xy;
    u_xlat10_3 = texture2D(_MainTex, u_xlat3.xy);
    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3 = u_xlat0.zwxw * u_xlat1.zwxw + vs_TEXCOORD0.xyxy;
    u_xlat4 = u_xlat0.zywy * u_xlat1.zxwx + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_5.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat10_0 = texture2D(_MainTex, u_xlat3.xy);
    u_xlat10_1 = texture2D(_MainTex, u_xlat3.zw);
    u_xlat16_6.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_7.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(16.0, 16.0, 16.0) + u_xlat2.xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_7.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(32.0, 32.0, 32.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat10_1 = texture2D(_MainTex, u_xlat4.xy);
    u_xlat10_2 = texture2D(_MainTex, u_xlat4.zw);
    u_xlat16_6.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_7.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(0.0625, 0.0625, 0.0625);
    u_xlat10_0 = texture2D(_BaseTex, vs_TEXCOORD1.xy);
    u_xlat16_6.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat24 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat24 = max(u_xlat24, u_xlat1.x);
    u_xlat24 = u_xlat24 * 255.0;
    u_xlat24 = ceil(u_xlat24);
    u_xlat1.w = u_xlat24 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
UNITY_LOCATION(0) uniform mediump sampler2D _BaseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat24;
void main()
{
    u_xlat0.x = 1.0;
    u_xlat0.z = _SampleScale;
    u_xlat0 = u_xlat0.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.0);
    u_xlat1.x = _SampleScale;
    u_xlat2 = (-u_xlat0.xywy) * u_xlat1.xxwx + vs_TEXCOORD0.xyxy;
    u_xlat16_3 = texture(_MainTex, u_xlat2.zw);
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat16_5.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(16.0, 16.0, 16.0);
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3.xy = (-u_xlat0.zy) * u_xlat1.zx + vs_TEXCOORD0.xy;
    u_xlat16_3 = texture(_MainTex, u_xlat3.xy);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3 = u_xlat0.zwxw * u_xlat1.zwxw + vs_TEXCOORD0.xyxy;
    u_xlat4 = u_xlat0.zywy * u_xlat1.zxwx + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_5.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_0 = texture(_MainTex, u_xlat3.xy);
    u_xlat16_1 = texture(_MainTex, u_xlat3.zw);
    u_xlat16_6.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_7.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(16.0, 16.0, 16.0) + u_xlat2.xyz;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_7.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(32.0, 32.0, 32.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat4.xy);
    u_xlat16_2 = texture(_MainTex, u_xlat4.zw);
    u_xlat16_6.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(0.0625, 0.0625, 0.0625);
    u_xlat16_0 = texture(_BaseTex, vs_TEXCOORD1.xy);
    u_xlat16_6.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat24 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat24 = max(u_xlat24, u_xlat1.x);
    u_xlat24 = u_xlat24 * 255.0;
    u_xlat24 = ceil(u_xlat24);
    u_xlat1.w = u_xlat24 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
UNITY_LOCATION(0) uniform mediump sampler2D _BaseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat24;
void main()
{
    u_xlat0.x = 1.0;
    u_xlat0.z = _SampleScale;
    u_xlat0 = u_xlat0.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.0);
    u_xlat1.x = _SampleScale;
    u_xlat2 = (-u_xlat0.xywy) * u_xlat1.xxwx + vs_TEXCOORD0.xyxy;
    u_xlat16_3 = texture(_MainTex, u_xlat2.zw);
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat16_5.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(16.0, 16.0, 16.0);
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3.xy = (-u_xlat0.zy) * u_xlat1.zx + vs_TEXCOORD0.xy;
    u_xlat16_3 = texture(_MainTex, u_xlat3.xy);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3 = u_xlat0.zwxw * u_xlat1.zwxw + vs_TEXCOORD0.xyxy;
    u_xlat4 = u_xlat0.zywy * u_xlat1.zxwx + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_5.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_0 = texture(_MainTex, u_xlat3.xy);
    u_xlat16_1 = texture(_MainTex, u_xlat3.zw);
    u_xlat16_6.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_7.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(16.0, 16.0, 16.0) + u_xlat2.xyz;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_7.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(32.0, 32.0, 32.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat4.xy);
    u_xlat16_2 = texture(_MainTex, u_xlat4.zw);
    u_xlat16_6.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(0.0625, 0.0625, 0.0625);
    u_xlat16_0 = texture(_BaseTex, vs_TEXCOORD1.xy);
    u_xlat16_6.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat24 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat24 = max(u_xlat24, u_xlat1.x);
    u_xlat24 = u_xlat24 * 255.0;
    u_xlat24 = ceil(u_xlat24);
    u_xlat1.w = u_xlat24 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
UNITY_LOCATION(0) uniform mediump sampler2D _BaseTex;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
float u_xlat24;
void main()
{
    u_xlat0.x = 1.0;
    u_xlat0.z = _SampleScale;
    u_xlat0 = u_xlat0.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.0);
    u_xlat1.x = _SampleScale;
    u_xlat2 = (-u_xlat0.xywy) * u_xlat1.xxwx + vs_TEXCOORD0.xyxy;
    u_xlat16_3 = texture(_MainTex, u_xlat2.zw);
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat16_5.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(16.0, 16.0, 16.0);
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3.xy = (-u_xlat0.zy) * u_xlat1.zx + vs_TEXCOORD0.xy;
    u_xlat16_3 = texture(_MainTex, u_xlat3.xy);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3 = u_xlat0.zwxw * u_xlat1.zwxw + vs_TEXCOORD0.xyxy;
    u_xlat4 = u_xlat0.zywy * u_xlat1.zxwx + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_5.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_0 = texture(_MainTex, u_xlat3.xy);
    u_xlat16_1 = texture(_MainTex, u_xlat3.zw);
    u_xlat16_6.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_7.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(16.0, 16.0, 16.0) + u_xlat2.xyz;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_7.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(32.0, 32.0, 32.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat4.xy);
    u_xlat16_2 = texture(_MainTex, u_xlat4.zw);
    u_xlat16_6.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(0.0625, 0.0625, 0.0625);
    u_xlat16_0 = texture(_BaseTex, vs_TEXCOORD1.xy);
    u_xlat16_6.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(0.125, 0.125, 0.125);
    u_xlat24 = max(u_xlat0.y, u_xlat0.x);
    u_xlat1.x = max(u_xlat0.z, 9.99999997e-07);
    u_xlat24 = max(u_xlat24, u_xlat1.x);
    u_xlat24 = u_xlat24 * 255.0;
    u_xlat24 = ceil(u_xlat24);
    u_xlat1.w = u_xlat24 * 0.00392156886;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat1.www;
    SV_Target0 = u_xlat1;
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
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 478899
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	mediump float _Intensity;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat1.x = _SampleScale * 0.5;
    u_xlat2 = u_xlat0.xyzy * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwzw * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat2.zw);
    u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy);
    u_xlat16_3.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_4.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat1.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_4.xyz;
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_4.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Intensity);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	mediump float _Intensity;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat1.x = _SampleScale * 0.5;
    u_xlat2 = u_xlat0.xyzy * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwzw * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat2.zw);
    u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy);
    u_xlat16_3.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_4.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat1.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_4.xyz;
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_4.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Intensity);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	mediump float _Intensity;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat1.x = _SampleScale * 0.5;
    u_xlat2 = u_xlat0.xyzy * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwzw * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat2.zw);
    u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy);
    u_xlat16_3.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_4.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat1.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_4.xyz;
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_4.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Intensity);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	mediump float _Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat1.x = _SampleScale * 0.5;
    u_xlat2 = u_xlat0.xyzy * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwzw * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat16_1 = texture(_MainTex, u_xlat2.zw);
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat16_4.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat1.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_4.xyz;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Intensity);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	mediump float _Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat1.x = _SampleScale * 0.5;
    u_xlat2 = u_xlat0.xyzy * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwzw * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat16_1 = texture(_MainTex, u_xlat2.zw);
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat16_4.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat1.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_4.xyz;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Intensity);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	mediump float _Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat1.x = _SampleScale * 0.5;
    u_xlat2 = u_xlat0.xyzy * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwzw * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat16_1 = texture(_MainTex, u_xlat2.zw);
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat16_4.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat1.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_4.xyz;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Intensity);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	mediump float _Intensity;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat1.x = _SampleScale * 0.5;
    u_xlat2 = u_xlat0.xyzy * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwzw * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat2.zw);
    u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy);
    u_xlat16_3.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_4.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat1.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_4.xyz;
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_4.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Intensity);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	mediump float _Intensity;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat1.x = _SampleScale * 0.5;
    u_xlat2 = u_xlat0.xyzy * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwzw * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat2.zw);
    u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy);
    u_xlat16_3.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_4.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat1.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_4.xyz;
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_4.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Intensity);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	mediump float _Intensity;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat1.x = _SampleScale * 0.5;
    u_xlat2 = u_xlat0.xyzy * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwzw * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat10_1 = texture2D(_MainTex, u_xlat2.zw);
    u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy);
    u_xlat16_3.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_4.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat1.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_4.xyz;
    u_xlat10_2 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat16_4.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Intensity);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	mediump float _Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat1.x = _SampleScale * 0.5;
    u_xlat2 = u_xlat0.xyzy * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwzw * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat16_1 = texture(_MainTex, u_xlat2.zw);
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat16_4.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat1.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_4.xyz;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Intensity);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	mediump float _Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat1.x = _SampleScale * 0.5;
    u_xlat2 = u_xlat0.xyzy * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwzw * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat16_1 = texture(_MainTex, u_xlat2.zw);
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat16_4.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat1.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_4.xyz;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Intensity);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	mediump float _Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -1.0, 1.0, 1.0);
    u_xlat1.x = _SampleScale * 0.5;
    u_xlat2 = u_xlat0.xyzy * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat0 = u_xlat0.xwzw * u_xlat1.xxxx + vs_TEXCOORD0.xyxy;
    u_xlat16_1 = texture(_MainTex, u_xlat2.zw);
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat16_4.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0);
    u_xlat1.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat16_4.xyz;
    u_xlat16_2 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_0 = texture(_MainTex, u_xlat0.zw);
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat1.xyz;
    u_xlat0.xyz = u_xlat16_3.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_3.xyz = u_xlat0.xyz * vec3(0.25, 0.25, 0.25);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(_Intensity);
    u_xlat16_3.xyz = max(u_xlat16_3.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
}
}
 Pass {
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 542205
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	mediump float _Intensity;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
void main()
{
    u_xlat0.x = 1.0;
    u_xlat0.z = _SampleScale;
    u_xlat0 = u_xlat0.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.0);
    u_xlat1.x = _SampleScale;
    u_xlat2 = (-u_xlat0.xywy) * u_xlat1.xxwx + vs_TEXCOORD0.xyxy;
    u_xlat10_3 = texture2D(_MainTex, u_xlat2.zw);
    u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy);
    u_xlat16_4.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_5.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(16.0, 16.0, 16.0);
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3.xy = (-u_xlat0.zy) * u_xlat1.zx + vs_TEXCOORD0.xy;
    u_xlat10_3 = texture2D(_MainTex, u_xlat3.xy);
    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3 = u_xlat0.zwxw * u_xlat1.zwxw + vs_TEXCOORD0.xyxy;
    u_xlat4 = u_xlat0.zywy * u_xlat1.zxwx + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_5.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat10_0 = texture2D(_MainTex, u_xlat3.xy);
    u_xlat10_1 = texture2D(_MainTex, u_xlat3.zw);
    u_xlat16_6.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_7.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(16.0, 16.0, 16.0) + u_xlat2.xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_7.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(32.0, 32.0, 32.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat10_1 = texture2D(_MainTex, u_xlat4.xy);
    u_xlat10_2 = texture2D(_MainTex, u_xlat4.zw);
    u_xlat16_6.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_7.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(0.0625, 0.0625, 0.0625);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Intensity);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_5.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	mediump float _Intensity;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
void main()
{
    u_xlat0.x = 1.0;
    u_xlat0.z = _SampleScale;
    u_xlat0 = u_xlat0.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.0);
    u_xlat1.x = _SampleScale;
    u_xlat2 = (-u_xlat0.xywy) * u_xlat1.xxwx + vs_TEXCOORD0.xyxy;
    u_xlat10_3 = texture2D(_MainTex, u_xlat2.zw);
    u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy);
    u_xlat16_4.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_5.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(16.0, 16.0, 16.0);
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3.xy = (-u_xlat0.zy) * u_xlat1.zx + vs_TEXCOORD0.xy;
    u_xlat10_3 = texture2D(_MainTex, u_xlat3.xy);
    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3 = u_xlat0.zwxw * u_xlat1.zwxw + vs_TEXCOORD0.xyxy;
    u_xlat4 = u_xlat0.zywy * u_xlat1.zxwx + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_5.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat10_0 = texture2D(_MainTex, u_xlat3.xy);
    u_xlat10_1 = texture2D(_MainTex, u_xlat3.zw);
    u_xlat16_6.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_7.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(16.0, 16.0, 16.0) + u_xlat2.xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_7.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(32.0, 32.0, 32.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat10_1 = texture2D(_MainTex, u_xlat4.xy);
    u_xlat10_2 = texture2D(_MainTex, u_xlat4.zw);
    u_xlat16_6.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_7.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(0.0625, 0.0625, 0.0625);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Intensity);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_5.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	mediump float _Intensity;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
void main()
{
    u_xlat0.x = 1.0;
    u_xlat0.z = _SampleScale;
    u_xlat0 = u_xlat0.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.0);
    u_xlat1.x = _SampleScale;
    u_xlat2 = (-u_xlat0.xywy) * u_xlat1.xxwx + vs_TEXCOORD0.xyxy;
    u_xlat10_3 = texture2D(_MainTex, u_xlat2.zw);
    u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy);
    u_xlat16_4.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_5.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(16.0, 16.0, 16.0);
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3.xy = (-u_xlat0.zy) * u_xlat1.zx + vs_TEXCOORD0.xy;
    u_xlat10_3 = texture2D(_MainTex, u_xlat3.xy);
    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3 = u_xlat0.zwxw * u_xlat1.zwxw + vs_TEXCOORD0.xyxy;
    u_xlat4 = u_xlat0.zywy * u_xlat1.zxwx + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_5.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat10_0 = texture2D(_MainTex, u_xlat3.xy);
    u_xlat10_1 = texture2D(_MainTex, u_xlat3.zw);
    u_xlat16_6.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_7.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(16.0, 16.0, 16.0) + u_xlat2.xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_7.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(32.0, 32.0, 32.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat10_1 = texture2D(_MainTex, u_xlat4.xy);
    u_xlat10_2 = texture2D(_MainTex, u_xlat4.zw);
    u_xlat16_6.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_7.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(0.0625, 0.0625, 0.0625);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Intensity);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_5.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	mediump float _Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
void main()
{
    u_xlat0.x = 1.0;
    u_xlat0.z = _SampleScale;
    u_xlat0 = u_xlat0.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.0);
    u_xlat1.x = _SampleScale;
    u_xlat2 = (-u_xlat0.xywy) * u_xlat1.xxwx + vs_TEXCOORD0.xyxy;
    u_xlat16_3 = texture(_MainTex, u_xlat2.zw);
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat16_5.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(16.0, 16.0, 16.0);
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3.xy = (-u_xlat0.zy) * u_xlat1.zx + vs_TEXCOORD0.xy;
    u_xlat16_3 = texture(_MainTex, u_xlat3.xy);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3 = u_xlat0.zwxw * u_xlat1.zwxw + vs_TEXCOORD0.xyxy;
    u_xlat4 = u_xlat0.zywy * u_xlat1.zxwx + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_5.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_0 = texture(_MainTex, u_xlat3.xy);
    u_xlat16_1 = texture(_MainTex, u_xlat3.zw);
    u_xlat16_6.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_7.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(16.0, 16.0, 16.0) + u_xlat2.xyz;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_7.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(32.0, 32.0, 32.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat4.xy);
    u_xlat16_2 = texture(_MainTex, u_xlat4.zw);
    u_xlat16_6.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(0.0625, 0.0625, 0.0625);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Intensity);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_5.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	mediump float _Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
void main()
{
    u_xlat0.x = 1.0;
    u_xlat0.z = _SampleScale;
    u_xlat0 = u_xlat0.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.0);
    u_xlat1.x = _SampleScale;
    u_xlat2 = (-u_xlat0.xywy) * u_xlat1.xxwx + vs_TEXCOORD0.xyxy;
    u_xlat16_3 = texture(_MainTex, u_xlat2.zw);
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat16_5.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(16.0, 16.0, 16.0);
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3.xy = (-u_xlat0.zy) * u_xlat1.zx + vs_TEXCOORD0.xy;
    u_xlat16_3 = texture(_MainTex, u_xlat3.xy);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3 = u_xlat0.zwxw * u_xlat1.zwxw + vs_TEXCOORD0.xyxy;
    u_xlat4 = u_xlat0.zywy * u_xlat1.zxwx + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_5.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_0 = texture(_MainTex, u_xlat3.xy);
    u_xlat16_1 = texture(_MainTex, u_xlat3.zw);
    u_xlat16_6.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_7.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(16.0, 16.0, 16.0) + u_xlat2.xyz;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_7.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(32.0, 32.0, 32.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat4.xy);
    u_xlat16_2 = texture(_MainTex, u_xlat4.zw);
    u_xlat16_6.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(0.0625, 0.0625, 0.0625);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Intensity);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_5.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	mediump float _Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
void main()
{
    u_xlat0.x = 1.0;
    u_xlat0.z = _SampleScale;
    u_xlat0 = u_xlat0.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.0);
    u_xlat1.x = _SampleScale;
    u_xlat2 = (-u_xlat0.xywy) * u_xlat1.xxwx + vs_TEXCOORD0.xyxy;
    u_xlat16_3 = texture(_MainTex, u_xlat2.zw);
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat16_5.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(16.0, 16.0, 16.0);
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3.xy = (-u_xlat0.zy) * u_xlat1.zx + vs_TEXCOORD0.xy;
    u_xlat16_3 = texture(_MainTex, u_xlat3.xy);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3 = u_xlat0.zwxw * u_xlat1.zwxw + vs_TEXCOORD0.xyxy;
    u_xlat4 = u_xlat0.zywy * u_xlat1.zxwx + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_5.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_0 = texture(_MainTex, u_xlat3.xy);
    u_xlat16_1 = texture(_MainTex, u_xlat3.zw);
    u_xlat16_6.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_7.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(16.0, 16.0, 16.0) + u_xlat2.xyz;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_7.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(32.0, 32.0, 32.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat4.xy);
    u_xlat16_2 = texture(_MainTex, u_xlat4.zw);
    u_xlat16_6.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(0.0625, 0.0625, 0.0625);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Intensity);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_5.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	mediump float _Intensity;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
void main()
{
    u_xlat0.x = 1.0;
    u_xlat0.z = _SampleScale;
    u_xlat0 = u_xlat0.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.0);
    u_xlat1.x = _SampleScale;
    u_xlat2 = (-u_xlat0.xywy) * u_xlat1.xxwx + vs_TEXCOORD0.xyxy;
    u_xlat10_3 = texture2D(_MainTex, u_xlat2.zw);
    u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy);
    u_xlat16_4.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_5.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(16.0, 16.0, 16.0);
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3.xy = (-u_xlat0.zy) * u_xlat1.zx + vs_TEXCOORD0.xy;
    u_xlat10_3 = texture2D(_MainTex, u_xlat3.xy);
    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3 = u_xlat0.zwxw * u_xlat1.zwxw + vs_TEXCOORD0.xyxy;
    u_xlat4 = u_xlat0.zywy * u_xlat1.zxwx + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_5.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat10_0 = texture2D(_MainTex, u_xlat3.xy);
    u_xlat10_1 = texture2D(_MainTex, u_xlat3.zw);
    u_xlat16_6.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_7.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(16.0, 16.0, 16.0) + u_xlat2.xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_7.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(32.0, 32.0, 32.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat10_1 = texture2D(_MainTex, u_xlat4.xy);
    u_xlat10_2 = texture2D(_MainTex, u_xlat4.zw);
    u_xlat16_6.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_7.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(0.0625, 0.0625, 0.0625);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Intensity);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_5.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	mediump float _Intensity;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
void main()
{
    u_xlat0.x = 1.0;
    u_xlat0.z = _SampleScale;
    u_xlat0 = u_xlat0.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.0);
    u_xlat1.x = _SampleScale;
    u_xlat2 = (-u_xlat0.xywy) * u_xlat1.xxwx + vs_TEXCOORD0.xyxy;
    u_xlat10_3 = texture2D(_MainTex, u_xlat2.zw);
    u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy);
    u_xlat16_4.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_5.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(16.0, 16.0, 16.0);
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3.xy = (-u_xlat0.zy) * u_xlat1.zx + vs_TEXCOORD0.xy;
    u_xlat10_3 = texture2D(_MainTex, u_xlat3.xy);
    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3 = u_xlat0.zwxw * u_xlat1.zwxw + vs_TEXCOORD0.xyxy;
    u_xlat4 = u_xlat0.zywy * u_xlat1.zxwx + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_5.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat10_0 = texture2D(_MainTex, u_xlat3.xy);
    u_xlat10_1 = texture2D(_MainTex, u_xlat3.zw);
    u_xlat16_6.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_7.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(16.0, 16.0, 16.0) + u_xlat2.xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_7.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(32.0, 32.0, 32.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat10_1 = texture2D(_MainTex, u_xlat4.xy);
    u_xlat10_2 = texture2D(_MainTex, u_xlat4.zw);
    u_xlat16_6.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_7.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(0.0625, 0.0625, 0.0625);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Intensity);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_5.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier02 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	mediump float _Intensity;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
void main()
{
    u_xlat0.x = 1.0;
    u_xlat0.z = _SampleScale;
    u_xlat0 = u_xlat0.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.0);
    u_xlat1.x = _SampleScale;
    u_xlat2 = (-u_xlat0.xywy) * u_xlat1.xxwx + vs_TEXCOORD0.xyxy;
    u_xlat10_3 = texture2D(_MainTex, u_xlat2.zw);
    u_xlat10_2 = texture2D(_MainTex, u_xlat2.xy);
    u_xlat16_4.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_5.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(16.0, 16.0, 16.0);
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3.xy = (-u_xlat0.zy) * u_xlat1.zx + vs_TEXCOORD0.xy;
    u_xlat10_3 = texture2D(_MainTex, u_xlat3.xy);
    u_xlat16_4.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3 = u_xlat0.zwxw * u_xlat1.zwxw + vs_TEXCOORD0.xyxy;
    u_xlat4 = u_xlat0.zywy * u_xlat1.zxwx + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx + vs_TEXCOORD0.xy;
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat16_5.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat10_0 = texture2D(_MainTex, u_xlat3.xy);
    u_xlat10_1 = texture2D(_MainTex, u_xlat3.zw);
    u_xlat16_6.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat16_7.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(16.0, 16.0, 16.0) + u_xlat2.xyz;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_7.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(32.0, 32.0, 32.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat10_1 = texture2D(_MainTex, u_xlat4.xy);
    u_xlat10_2 = texture2D(_MainTex, u_xlat4.zw);
    u_xlat16_6.xyz = u_xlat10_2.www * u_xlat10_2.xyz;
    u_xlat16_7.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(0.0625, 0.0625, 0.0625);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Intensity);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_5.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	mediump float _Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
void main()
{
    u_xlat0.x = 1.0;
    u_xlat0.z = _SampleScale;
    u_xlat0 = u_xlat0.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.0);
    u_xlat1.x = _SampleScale;
    u_xlat2 = (-u_xlat0.xywy) * u_xlat1.xxwx + vs_TEXCOORD0.xyxy;
    u_xlat16_3 = texture(_MainTex, u_xlat2.zw);
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat16_5.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(16.0, 16.0, 16.0);
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3.xy = (-u_xlat0.zy) * u_xlat1.zx + vs_TEXCOORD0.xy;
    u_xlat16_3 = texture(_MainTex, u_xlat3.xy);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3 = u_xlat0.zwxw * u_xlat1.zwxw + vs_TEXCOORD0.xyxy;
    u_xlat4 = u_xlat0.zywy * u_xlat1.zxwx + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_5.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_0 = texture(_MainTex, u_xlat3.xy);
    u_xlat16_1 = texture(_MainTex, u_xlat3.zw);
    u_xlat16_6.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_7.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(16.0, 16.0, 16.0) + u_xlat2.xyz;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_7.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(32.0, 32.0, 32.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat4.xy);
    u_xlat16_2 = texture(_MainTex, u_xlat4.zw);
    u_xlat16_6.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(0.0625, 0.0625, 0.0625);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Intensity);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_5.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	mediump float _Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
void main()
{
    u_xlat0.x = 1.0;
    u_xlat0.z = _SampleScale;
    u_xlat0 = u_xlat0.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.0);
    u_xlat1.x = _SampleScale;
    u_xlat2 = (-u_xlat0.xywy) * u_xlat1.xxwx + vs_TEXCOORD0.xyxy;
    u_xlat16_3 = texture(_MainTex, u_xlat2.zw);
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat16_5.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(16.0, 16.0, 16.0);
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3.xy = (-u_xlat0.zy) * u_xlat1.zx + vs_TEXCOORD0.xy;
    u_xlat16_3 = texture(_MainTex, u_xlat3.xy);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3 = u_xlat0.zwxw * u_xlat1.zwxw + vs_TEXCOORD0.xyxy;
    u_xlat4 = u_xlat0.zywy * u_xlat1.zxwx + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_5.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_0 = texture(_MainTex, u_xlat3.xy);
    u_xlat16_1 = texture(_MainTex, u_xlat3.zw);
    u_xlat16_6.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_7.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(16.0, 16.0, 16.0) + u_xlat2.xyz;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_7.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(32.0, 32.0, 32.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat4.xy);
    u_xlat16_2 = texture(_MainTex, u_xlat4.zw);
    u_xlat16_6.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(0.0625, 0.0625, 0.0625);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Intensity);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_5.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
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
uniform 	mediump vec4 _MainTex_ST;
uniform 	mediump vec4 _BaseTex_ST;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _BaseTex_ST.xy + _BaseTex_ST.zw;
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
uniform 	vec2 _MainTex_TexelSize;
uniform 	float _SampleScale;
uniform 	mediump float _Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
void main()
{
    u_xlat0.x = 1.0;
    u_xlat0.z = _SampleScale;
    u_xlat0 = u_xlat0.xxzz * _MainTex_TexelSize.xyxy;
    u_xlat1.z = float(-1.0);
    u_xlat1.w = float(0.0);
    u_xlat1.x = _SampleScale;
    u_xlat2 = (-u_xlat0.xywy) * u_xlat1.xxwx + vs_TEXCOORD0.xyxy;
    u_xlat16_3 = texture(_MainTex, u_xlat2.zw);
    u_xlat16_2 = texture(_MainTex, u_xlat2.xy);
    u_xlat16_4.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat16_5.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_5.xyz * vec3(16.0, 16.0, 16.0);
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3.xy = (-u_xlat0.zy) * u_xlat1.zx + vs_TEXCOORD0.xy;
    u_xlat16_3 = texture(_MainTex, u_xlat3.xy);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat16_4.xyz * vec3(8.0, 8.0, 8.0) + u_xlat2.xyz;
    u_xlat3 = u_xlat0.zwxw * u_xlat1.zwxw + vs_TEXCOORD0.xyxy;
    u_xlat4 = u_xlat0.zywy * u_xlat1.zxwx + vs_TEXCOORD0.xyxy;
    u_xlat0.xy = u_xlat0.xy * u_xlat1.xx + vs_TEXCOORD0.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat16_5.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat16_0 = texture(_MainTex, u_xlat3.xy);
    u_xlat16_1 = texture(_MainTex, u_xlat3.zw);
    u_xlat16_6.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat16_7.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(16.0, 16.0, 16.0) + u_xlat2.xyz;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat16_7.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(32.0, 32.0, 32.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat16_1 = texture(_MainTex, u_xlat4.xy);
    u_xlat16_2 = texture(_MainTex, u_xlat4.zw);
    u_xlat16_6.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(16.0, 16.0, 16.0) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_5.xyz * vec3(8.0, 8.0, 8.0) + u_xlat0.xyz;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(0.0625, 0.0625, 0.0625);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(_Intensity);
    u_xlat16_5.xyz = max(u_xlat16_5.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_5.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
SubProgram "gles hw_tier02 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_COLORSPACE_GAMMA" }
""
}
}
}
}
}