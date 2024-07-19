//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Effects/WeaponFX/GlowCutout" {
Properties {
_TintColor ("Tint Color", Color) = (0.5,0.5,0.5,1)
_TimeScale ("Time Scale", Vector) = (1,1,1,1)
_MainTex ("Noise Texture", 2D) = "white" { }
_BorderScale ("Border Scale (XY) Offset (Z)", Vector) = (0.5,0.05,1,0)
}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  Blend SrcAlpha OneMinusSrcAlpha, SrcAlpha OneMinusSrcAlpha
  ZWrite Off
  Cull Off
  GpuProgramID 46312
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _BorderScale;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_NORMAL0;
varying highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * _BorderScale.zzz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00999999978, 0.00999999978, 0.00999999978) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_NORMAL0.xyz = in_NORMAL0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 _TintColor;
uniform 	vec4 _TimeScale;
uniform 	vec4 _BorderScale;
uniform 	vec4 _MainTex_ST;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_NORMAL0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec2 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec2 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec2 u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_6;
vec2 u_xlat8;
lowp vec2 u_xlat10_8;
void main()
{
    u_xlat0.xy = _Time.xx * _TimeScale.xy;
    u_xlat8.xy = vs_TEXCOORD1.xy * _MainTex_ST.xx + u_xlat0.xy;
    u_xlat1 = vs_TEXCOORD1.xzzy * _MainTex_ST.xxxx + u_xlat0.xyxy;
    u_xlat10_0.xy = texture2D(_MainTex, u_xlat8.xy).xy;
    u_xlat10_8.xy = texture2D(_MainTex, u_xlat1.zw).xy;
    u_xlat10_1.xy = texture2D(_MainTex, u_xlat1.xy).xy;
    u_xlat16_2.x = abs(vs_NORMAL0.y) + abs(vs_NORMAL0.x);
    u_xlat16_2.x = u_xlat16_2.x + abs(vs_NORMAL0.z);
    u_xlat16_2.xyz = abs(vs_NORMAL0.xyz) / u_xlat16_2.xxx;
    u_xlat16_3.xy = u_xlat10_1.xy * u_xlat16_2.yy;
    u_xlat16_3.xy = u_xlat10_8.xy * u_xlat16_2.xx + u_xlat16_3.xy;
    u_xlat16_3.xy = u_xlat10_0.xy * u_xlat16_2.zz + u_xlat16_3.xy;
    u_xlat0.xy = _Time.xx * _TimeScale.zw + u_xlat16_3.xy;
    u_xlat1 = vs_TEXCOORD1.xzzy * _MainTex_ST.xxxx + u_xlat0.xyxy;
    u_xlat0.xy = vs_TEXCOORD1.xy * _MainTex_ST.xx + u_xlat0.xy;
    u_xlat10_0.xy = texture2D(_MainTex, u_xlat0.xy).xy;
    u_xlat10_8.xy = texture2D(_MainTex, u_xlat1.xy).xy;
    u_xlat10_1.xy = texture2D(_MainTex, u_xlat1.zw).xy;
    u_xlat16_6.xz = u_xlat16_2.yy * u_xlat10_8.xy;
    u_xlat16_2.xy = u_xlat10_1.xy * u_xlat16_2.xx + u_xlat16_6.xz;
    u_xlat16_2.xy = u_xlat10_0.xy * u_xlat16_2.zz + u_xlat16_2.xy;
    u_xlat0.x = (-_BorderScale.y) + _BorderScale.x;
    u_xlatb0 = u_xlat0.x>=u_xlat16_2.x;
    u_xlat0.x = (u_xlatb0) ? -1.0 : -0.0;
    u_xlatb4 = _BorderScale.x>=u_xlat16_2.x;
    u_xlat4 = u_xlatb4 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + u_xlat4;
    u_xlat0.x = u_xlat16_2.y * u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * vs_COLOR0;
    u_xlat0 = u_xlat0 * _TintColor;
    u_xlat0.w = u_xlat0.w;
    u_xlat0.w = clamp(u_xlat0.w, 0.0, 1.0);
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _BorderScale;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_NORMAL0;
varying highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * _BorderScale.zzz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00999999978, 0.00999999978, 0.00999999978) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_NORMAL0.xyz = in_NORMAL0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 _TintColor;
uniform 	vec4 _TimeScale;
uniform 	vec4 _BorderScale;
uniform 	vec4 _MainTex_ST;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_NORMAL0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec2 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec2 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec2 u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_6;
vec2 u_xlat8;
lowp vec2 u_xlat10_8;
void main()
{
    u_xlat0.xy = _Time.xx * _TimeScale.xy;
    u_xlat8.xy = vs_TEXCOORD1.xy * _MainTex_ST.xx + u_xlat0.xy;
    u_xlat1 = vs_TEXCOORD1.xzzy * _MainTex_ST.xxxx + u_xlat0.xyxy;
    u_xlat10_0.xy = texture2D(_MainTex, u_xlat8.xy).xy;
    u_xlat10_8.xy = texture2D(_MainTex, u_xlat1.zw).xy;
    u_xlat10_1.xy = texture2D(_MainTex, u_xlat1.xy).xy;
    u_xlat16_2.x = abs(vs_NORMAL0.y) + abs(vs_NORMAL0.x);
    u_xlat16_2.x = u_xlat16_2.x + abs(vs_NORMAL0.z);
    u_xlat16_2.xyz = abs(vs_NORMAL0.xyz) / u_xlat16_2.xxx;
    u_xlat16_3.xy = u_xlat10_1.xy * u_xlat16_2.yy;
    u_xlat16_3.xy = u_xlat10_8.xy * u_xlat16_2.xx + u_xlat16_3.xy;
    u_xlat16_3.xy = u_xlat10_0.xy * u_xlat16_2.zz + u_xlat16_3.xy;
    u_xlat0.xy = _Time.xx * _TimeScale.zw + u_xlat16_3.xy;
    u_xlat1 = vs_TEXCOORD1.xzzy * _MainTex_ST.xxxx + u_xlat0.xyxy;
    u_xlat0.xy = vs_TEXCOORD1.xy * _MainTex_ST.xx + u_xlat0.xy;
    u_xlat10_0.xy = texture2D(_MainTex, u_xlat0.xy).xy;
    u_xlat10_8.xy = texture2D(_MainTex, u_xlat1.xy).xy;
    u_xlat10_1.xy = texture2D(_MainTex, u_xlat1.zw).xy;
    u_xlat16_6.xz = u_xlat16_2.yy * u_xlat10_8.xy;
    u_xlat16_2.xy = u_xlat10_1.xy * u_xlat16_2.xx + u_xlat16_6.xz;
    u_xlat16_2.xy = u_xlat10_0.xy * u_xlat16_2.zz + u_xlat16_2.xy;
    u_xlat0.x = (-_BorderScale.y) + _BorderScale.x;
    u_xlatb0 = u_xlat0.x>=u_xlat16_2.x;
    u_xlat0.x = (u_xlatb0) ? -1.0 : -0.0;
    u_xlatb4 = _BorderScale.x>=u_xlat16_2.x;
    u_xlat4 = u_xlatb4 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + u_xlat4;
    u_xlat0.x = u_xlat16_2.y * u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * vs_COLOR0;
    u_xlat0 = u_xlat0 * _TintColor;
    u_xlat0.w = u_xlat0.w;
    u_xlat0.w = clamp(u_xlat0.w, 0.0, 1.0);
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _BorderScale;
uniform 	vec4 _MainTex_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec3 in_NORMAL0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_NORMAL0;
varying highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * _BorderScale.zzz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00999999978, 0.00999999978, 0.00999999978) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_NORMAL0.xyz = in_NORMAL0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 _TintColor;
uniform 	vec4 _TimeScale;
uniform 	vec4 _BorderScale;
uniform 	vec4 _MainTex_ST;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying highp vec3 vs_NORMAL0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec2 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
lowp vec2 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec2 u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_6;
vec2 u_xlat8;
lowp vec2 u_xlat10_8;
void main()
{
    u_xlat0.xy = _Time.xx * _TimeScale.xy;
    u_xlat8.xy = vs_TEXCOORD1.xy * _MainTex_ST.xx + u_xlat0.xy;
    u_xlat1 = vs_TEXCOORD1.xzzy * _MainTex_ST.xxxx + u_xlat0.xyxy;
    u_xlat10_0.xy = texture2D(_MainTex, u_xlat8.xy).xy;
    u_xlat10_8.xy = texture2D(_MainTex, u_xlat1.zw).xy;
    u_xlat10_1.xy = texture2D(_MainTex, u_xlat1.xy).xy;
    u_xlat16_2.x = abs(vs_NORMAL0.y) + abs(vs_NORMAL0.x);
    u_xlat16_2.x = u_xlat16_2.x + abs(vs_NORMAL0.z);
    u_xlat16_2.xyz = abs(vs_NORMAL0.xyz) / u_xlat16_2.xxx;
    u_xlat16_3.xy = u_xlat10_1.xy * u_xlat16_2.yy;
    u_xlat16_3.xy = u_xlat10_8.xy * u_xlat16_2.xx + u_xlat16_3.xy;
    u_xlat16_3.xy = u_xlat10_0.xy * u_xlat16_2.zz + u_xlat16_3.xy;
    u_xlat0.xy = _Time.xx * _TimeScale.zw + u_xlat16_3.xy;
    u_xlat1 = vs_TEXCOORD1.xzzy * _MainTex_ST.xxxx + u_xlat0.xyxy;
    u_xlat0.xy = vs_TEXCOORD1.xy * _MainTex_ST.xx + u_xlat0.xy;
    u_xlat10_0.xy = texture2D(_MainTex, u_xlat0.xy).xy;
    u_xlat10_8.xy = texture2D(_MainTex, u_xlat1.xy).xy;
    u_xlat10_1.xy = texture2D(_MainTex, u_xlat1.zw).xy;
    u_xlat16_6.xz = u_xlat16_2.yy * u_xlat10_8.xy;
    u_xlat16_2.xy = u_xlat10_1.xy * u_xlat16_2.xx + u_xlat16_6.xz;
    u_xlat16_2.xy = u_xlat10_0.xy * u_xlat16_2.zz + u_xlat16_2.xy;
    u_xlat0.x = (-_BorderScale.y) + _BorderScale.x;
    u_xlatb0 = u_xlat0.x>=u_xlat16_2.x;
    u_xlat0.x = (u_xlatb0) ? -1.0 : -0.0;
    u_xlatb4 = _BorderScale.x>=u_xlat16_2.x;
    u_xlat4 = u_xlatb4 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + u_xlat4;
    u_xlat0.x = u_xlat16_2.y * u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * vs_COLOR0;
    u_xlat0 = u_xlat0 * _TintColor;
    u_xlat0.w = u_xlat0.w;
    u_xlat0.w = clamp(u_xlat0.w, 0.0, 1.0);
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _BorderScale;
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_NORMAL0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * _BorderScale.zzz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00999999978, 0.00999999978, 0.00999999978) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_NORMAL0.xyz = in_NORMAL0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 _TintColor;
uniform 	vec4 _TimeScale;
uniform 	vec4 _BorderScale;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_NORMAL0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec2 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec2 u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_6;
vec2 u_xlat8;
mediump vec2 u_xlat16_8;
void main()
{
    u_xlat0.xy = _Time.xx * _TimeScale.xy;
    u_xlat8.xy = vs_TEXCOORD1.xy * _MainTex_ST.xx + u_xlat0.xy;
    u_xlat1 = vs_TEXCOORD1.xzzy * _MainTex_ST.xxxx + u_xlat0.xyxy;
    u_xlat16_0.xy = texture(_MainTex, u_xlat8.xy).xy;
    u_xlat16_8.xy = texture(_MainTex, u_xlat1.zw).xy;
    u_xlat16_1.xy = texture(_MainTex, u_xlat1.xy).xy;
    u_xlat16_2.x = abs(vs_NORMAL0.y) + abs(vs_NORMAL0.x);
    u_xlat16_2.x = u_xlat16_2.x + abs(vs_NORMAL0.z);
    u_xlat16_2.xyz = abs(vs_NORMAL0.xyz) / u_xlat16_2.xxx;
    u_xlat16_3.xy = u_xlat16_1.xy * u_xlat16_2.yy;
    u_xlat16_3.xy = u_xlat16_8.xy * u_xlat16_2.xx + u_xlat16_3.xy;
    u_xlat16_3.xy = u_xlat16_0.xy * u_xlat16_2.zz + u_xlat16_3.xy;
    u_xlat0.xy = _Time.xx * _TimeScale.zw + u_xlat16_3.xy;
    u_xlat1 = vs_TEXCOORD1.xzzy * _MainTex_ST.xxxx + u_xlat0.xyxy;
    u_xlat0.xy = vs_TEXCOORD1.xy * _MainTex_ST.xx + u_xlat0.xy;
    u_xlat16_0.xy = texture(_MainTex, u_xlat0.xy).xy;
    u_xlat16_8.xy = texture(_MainTex, u_xlat1.xy).xy;
    u_xlat16_1.xy = texture(_MainTex, u_xlat1.zw).xy;
    u_xlat16_6.xz = u_xlat16_2.yy * u_xlat16_8.xy;
    u_xlat16_2.xy = u_xlat16_1.xy * u_xlat16_2.xx + u_xlat16_6.xz;
    u_xlat16_2.xy = u_xlat16_0.xy * u_xlat16_2.zz + u_xlat16_2.xy;
    u_xlat0.x = (-_BorderScale.y) + _BorderScale.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=u_xlat16_2.x);
#else
    u_xlatb0 = u_xlat0.x>=u_xlat16_2.x;
#endif
    u_xlat0.x = (u_xlatb0) ? -1.0 : -0.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_BorderScale.x>=u_xlat16_2.x);
#else
    u_xlatb4 = _BorderScale.x>=u_xlat16_2.x;
#endif
    u_xlat4 = u_xlatb4 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + u_xlat4;
    u_xlat0.x = u_xlat16_2.y * u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * vs_COLOR0;
    u_xlat0 = u_xlat0 * _TintColor;
    u_xlat0.w = u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.w = min(max(u_xlat0.w, 0.0), 1.0);
#else
    u_xlat0.w = clamp(u_xlat0.w, 0.0, 1.0);
#endif
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _BorderScale;
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_NORMAL0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * _BorderScale.zzz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00999999978, 0.00999999978, 0.00999999978) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_NORMAL0.xyz = in_NORMAL0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 _TintColor;
uniform 	vec4 _TimeScale;
uniform 	vec4 _BorderScale;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_NORMAL0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec2 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec2 u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_6;
vec2 u_xlat8;
mediump vec2 u_xlat16_8;
void main()
{
    u_xlat0.xy = _Time.xx * _TimeScale.xy;
    u_xlat8.xy = vs_TEXCOORD1.xy * _MainTex_ST.xx + u_xlat0.xy;
    u_xlat1 = vs_TEXCOORD1.xzzy * _MainTex_ST.xxxx + u_xlat0.xyxy;
    u_xlat16_0.xy = texture(_MainTex, u_xlat8.xy).xy;
    u_xlat16_8.xy = texture(_MainTex, u_xlat1.zw).xy;
    u_xlat16_1.xy = texture(_MainTex, u_xlat1.xy).xy;
    u_xlat16_2.x = abs(vs_NORMAL0.y) + abs(vs_NORMAL0.x);
    u_xlat16_2.x = u_xlat16_2.x + abs(vs_NORMAL0.z);
    u_xlat16_2.xyz = abs(vs_NORMAL0.xyz) / u_xlat16_2.xxx;
    u_xlat16_3.xy = u_xlat16_1.xy * u_xlat16_2.yy;
    u_xlat16_3.xy = u_xlat16_8.xy * u_xlat16_2.xx + u_xlat16_3.xy;
    u_xlat16_3.xy = u_xlat16_0.xy * u_xlat16_2.zz + u_xlat16_3.xy;
    u_xlat0.xy = _Time.xx * _TimeScale.zw + u_xlat16_3.xy;
    u_xlat1 = vs_TEXCOORD1.xzzy * _MainTex_ST.xxxx + u_xlat0.xyxy;
    u_xlat0.xy = vs_TEXCOORD1.xy * _MainTex_ST.xx + u_xlat0.xy;
    u_xlat16_0.xy = texture(_MainTex, u_xlat0.xy).xy;
    u_xlat16_8.xy = texture(_MainTex, u_xlat1.xy).xy;
    u_xlat16_1.xy = texture(_MainTex, u_xlat1.zw).xy;
    u_xlat16_6.xz = u_xlat16_2.yy * u_xlat16_8.xy;
    u_xlat16_2.xy = u_xlat16_1.xy * u_xlat16_2.xx + u_xlat16_6.xz;
    u_xlat16_2.xy = u_xlat16_0.xy * u_xlat16_2.zz + u_xlat16_2.xy;
    u_xlat0.x = (-_BorderScale.y) + _BorderScale.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=u_xlat16_2.x);
#else
    u_xlatb0 = u_xlat0.x>=u_xlat16_2.x;
#endif
    u_xlat0.x = (u_xlatb0) ? -1.0 : -0.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_BorderScale.x>=u_xlat16_2.x);
#else
    u_xlatb4 = _BorderScale.x>=u_xlat16_2.x;
#endif
    u_xlat4 = u_xlatb4 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + u_xlat4;
    u_xlat0.x = u_xlat16_2.y * u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * vs_COLOR0;
    u_xlat0 = u_xlat0 * _TintColor;
    u_xlat0.w = u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.w = min(max(u_xlat0.w, 0.0), 1.0);
#else
    u_xlat0.w = clamp(u_xlat0.w, 0.0, 1.0);
#endif
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _BorderScale;
uniform 	vec4 _MainTex_ST;
in highp vec4 in_POSITION0;
in mediump vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec3 in_NORMAL0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_NORMAL0;
out highp vec3 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_NORMAL0.xyz * _BorderScale.zzz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.00999999978, 0.00999999978, 0.00999999978) + in_POSITION0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat0 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    vs_NORMAL0.xyz = in_NORMAL0.xyz;
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
uniform 	vec4 _Time;
uniform 	vec4 _TintColor;
uniform 	vec4 _TimeScale;
uniform 	vec4 _BorderScale;
uniform 	vec4 _MainTex_ST;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in highp vec3 vs_NORMAL0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec2 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec2 u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
mediump vec3 u_xlat16_6;
vec2 u_xlat8;
mediump vec2 u_xlat16_8;
void main()
{
    u_xlat0.xy = _Time.xx * _TimeScale.xy;
    u_xlat8.xy = vs_TEXCOORD1.xy * _MainTex_ST.xx + u_xlat0.xy;
    u_xlat1 = vs_TEXCOORD1.xzzy * _MainTex_ST.xxxx + u_xlat0.xyxy;
    u_xlat16_0.xy = texture(_MainTex, u_xlat8.xy).xy;
    u_xlat16_8.xy = texture(_MainTex, u_xlat1.zw).xy;
    u_xlat16_1.xy = texture(_MainTex, u_xlat1.xy).xy;
    u_xlat16_2.x = abs(vs_NORMAL0.y) + abs(vs_NORMAL0.x);
    u_xlat16_2.x = u_xlat16_2.x + abs(vs_NORMAL0.z);
    u_xlat16_2.xyz = abs(vs_NORMAL0.xyz) / u_xlat16_2.xxx;
    u_xlat16_3.xy = u_xlat16_1.xy * u_xlat16_2.yy;
    u_xlat16_3.xy = u_xlat16_8.xy * u_xlat16_2.xx + u_xlat16_3.xy;
    u_xlat16_3.xy = u_xlat16_0.xy * u_xlat16_2.zz + u_xlat16_3.xy;
    u_xlat0.xy = _Time.xx * _TimeScale.zw + u_xlat16_3.xy;
    u_xlat1 = vs_TEXCOORD1.xzzy * _MainTex_ST.xxxx + u_xlat0.xyxy;
    u_xlat0.xy = vs_TEXCOORD1.xy * _MainTex_ST.xx + u_xlat0.xy;
    u_xlat16_0.xy = texture(_MainTex, u_xlat0.xy).xy;
    u_xlat16_8.xy = texture(_MainTex, u_xlat1.xy).xy;
    u_xlat16_1.xy = texture(_MainTex, u_xlat1.zw).xy;
    u_xlat16_6.xz = u_xlat16_2.yy * u_xlat16_8.xy;
    u_xlat16_2.xy = u_xlat16_1.xy * u_xlat16_2.xx + u_xlat16_6.xz;
    u_xlat16_2.xy = u_xlat16_0.xy * u_xlat16_2.zz + u_xlat16_2.xy;
    u_xlat0.x = (-_BorderScale.y) + _BorderScale.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat0.x>=u_xlat16_2.x);
#else
    u_xlatb0 = u_xlat0.x>=u_xlat16_2.x;
#endif
    u_xlat0.x = (u_xlatb0) ? -1.0 : -0.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_BorderScale.x>=u_xlat16_2.x);
#else
    u_xlatb4 = _BorderScale.x>=u_xlat16_2.x;
#endif
    u_xlat4 = u_xlatb4 ? 1.0 : float(0.0);
    u_xlat0.x = u_xlat0.x + u_xlat4;
    u_xlat0.x = u_xlat16_2.y * u_xlat0.x;
    u_xlat0 = u_xlat0.xxxx * vs_COLOR0;
    u_xlat0 = u_xlat0 * _TintColor;
    u_xlat0.w = u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.w = min(max(u_xlat0.w, 0.0), 1.0);
#else
    u_xlat0.w = clamp(u_xlat0.w, 0.0, 1.0);
#endif
    SV_Target0 = u_xlat0;
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
}
}