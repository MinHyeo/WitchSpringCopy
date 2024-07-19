//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Legacy Shaders/Self-Illumin/VertexLit" {
Properties {
_Color ("Main Color", Color) = (1,1,1,1)
_SpecColor ("Spec Color", Color) = (1,1,1,1)
[PowerSlider(5.0)] _Shininess ("Shininess", Range(0.1, 1)) = 0.7
_MainTex ("Base (RGB)", 2D) = "white" { }
_Illum ("Illumin (A)", 2D) = "white" { }
_Emission ("Emission (Lightmapper)", Float) = 1
}
SubShader {
 LOD 100
 Tags { "RenderType" = "Opaque" }
 Pass {
  Name "BASE"
  LOD 100
  Tags { "LIGHTMODE" = "Vertex" "RenderType" = "Opaque" }
  Fog {
   Mode Off
  }
  GpuProgramID 92629
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_18;
float u_xlat33;
int u_xlati34;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat16_7 = _Shininess * 128.0;
    u_xlat16_18.x = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat16_18.z = float(0.0);
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat16_41 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_41 = max(u_xlat16_41, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_41) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb2 = 0.0<u_xlat16_41;
        if(u_xlatb2){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + unity_LightPosition[u_xlati_loop_1].xyz;
            u_xlat16_41 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = inversesqrt(u_xlat16_41);
            u_xlat16_10.xyz = vec3(u_xlat16_41) * u_xlat16_10.xyz;
            u_xlat16_41 = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = max(u_xlat16_41, 0.0);
            u_xlat16_41 = log2(u_xlat16_41);
            u_xlat16_41 = u_xlat16_7 * u_xlat16_41;
            u_xlat16_41 = exp2(u_xlat16_41);
            u_xlat16_41 = min(u_xlat16_41, 1.0);
            u_xlat16_41 = u_xlat16_41 * 0.5;
            u_xlat16_8.xyz = vec3(u_xlat16_41) * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        }
        u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat16_18.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Illum;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0.x = texture2D(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat10_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_18;
float u_xlat33;
int u_xlati34;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat16_7 = _Shininess * 128.0;
    u_xlat16_18.x = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat16_18.z = float(0.0);
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat16_41 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_41 = max(u_xlat16_41, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_41) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb2 = 0.0<u_xlat16_41;
        if(u_xlatb2){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + unity_LightPosition[u_xlati_loop_1].xyz;
            u_xlat16_41 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = inversesqrt(u_xlat16_41);
            u_xlat16_10.xyz = vec3(u_xlat16_41) * u_xlat16_10.xyz;
            u_xlat16_41 = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = max(u_xlat16_41, 0.0);
            u_xlat16_41 = log2(u_xlat16_41);
            u_xlat16_41 = u_xlat16_7 * u_xlat16_41;
            u_xlat16_41 = exp2(u_xlat16_41);
            u_xlat16_41 = min(u_xlat16_41, 1.0);
            u_xlat16_41 = u_xlat16_41 * 0.5;
            u_xlat16_8.xyz = vec3(u_xlat16_41) * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        }
        u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat16_18.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Illum;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0.x = texture2D(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat10_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_18;
float u_xlat33;
int u_xlati34;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat16_7 = _Shininess * 128.0;
    u_xlat16_18.x = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat16_18.z = float(0.0);
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat16_41 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_41 = max(u_xlat16_41, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_41) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb2 = 0.0<u_xlat16_41;
        if(u_xlatb2){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + unity_LightPosition[u_xlati_loop_1].xyz;
            u_xlat16_41 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = inversesqrt(u_xlat16_41);
            u_xlat16_10.xyz = vec3(u_xlat16_41) * u_xlat16_10.xyz;
            u_xlat16_41 = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = max(u_xlat16_41, 0.0);
            u_xlat16_41 = log2(u_xlat16_41);
            u_xlat16_41 = u_xlat16_7 * u_xlat16_41;
            u_xlat16_41 = exp2(u_xlat16_41);
            u_xlat16_41 = min(u_xlat16_41, 1.0);
            u_xlat16_41 = u_xlat16_41 * 0.5;
            u_xlat16_8.xyz = vec3(u_xlat16_41) * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        }
        u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat16_18.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Illum;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0.x = texture2D(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat10_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
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
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_COLOR1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_18;
float u_xlat33;
int u_xlati34;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat16_7 = _Shininess * 128.0;
    u_xlat16_18.x = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat16_18.z = float(0.0);
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_41 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_41 = max(u_xlat16_41, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_41) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(0.0<u_xlat16_41);
#else
        u_xlatb2 = 0.0<u_xlat16_41;
#endif
        if(u_xlatb2){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + unity_LightPosition[u_xlati_loop_1].xyz;
            u_xlat16_41 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = inversesqrt(u_xlat16_41);
            u_xlat16_10.xyz = vec3(u_xlat16_41) * u_xlat16_10.xyz;
            u_xlat16_41 = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = max(u_xlat16_41, 0.0);
            u_xlat16_41 = log2(u_xlat16_41);
            u_xlat16_41 = u_xlat16_7 * u_xlat16_41;
            u_xlat16_41 = exp2(u_xlat16_41);
            u_xlat16_41 = min(u_xlat16_41, 1.0);
            u_xlat16_41 = u_xlat16_41 * 0.5;
            u_xlat16_8.xyz = vec3(u_xlat16_41) * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        }
        u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR1.xyz = min(max(vs_COLOR1.xyz, 0.0), 1.0);
#else
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.xyz = u_xlat16_18.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Illum;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_COLOR1;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
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
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_COLOR1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_18;
float u_xlat33;
int u_xlati34;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat16_7 = _Shininess * 128.0;
    u_xlat16_18.x = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat16_18.z = float(0.0);
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_41 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_41 = max(u_xlat16_41, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_41) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(0.0<u_xlat16_41);
#else
        u_xlatb2 = 0.0<u_xlat16_41;
#endif
        if(u_xlatb2){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + unity_LightPosition[u_xlati_loop_1].xyz;
            u_xlat16_41 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = inversesqrt(u_xlat16_41);
            u_xlat16_10.xyz = vec3(u_xlat16_41) * u_xlat16_10.xyz;
            u_xlat16_41 = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = max(u_xlat16_41, 0.0);
            u_xlat16_41 = log2(u_xlat16_41);
            u_xlat16_41 = u_xlat16_7 * u_xlat16_41;
            u_xlat16_41 = exp2(u_xlat16_41);
            u_xlat16_41 = min(u_xlat16_41, 1.0);
            u_xlat16_41 = u_xlat16_41 * 0.5;
            u_xlat16_8.xyz = vec3(u_xlat16_41) * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        }
        u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR1.xyz = min(max(vs_COLOR1.xyz, 0.0), 1.0);
#else
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.xyz = u_xlat16_18.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Illum;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_COLOR1;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
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
uniform 	mediump vec4 unity_LightColor[8];
uniform 	vec4 unity_LightPosition[8];
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_WorldToObject[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_COLOR1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_18;
float u_xlat33;
int u_xlati34;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat16_7 = _Shininess * 128.0;
    u_xlat16_18.x = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat16_18.z = float(0.0);
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_41 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_41 = max(u_xlat16_41, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_41) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(0.0<u_xlat16_41);
#else
        u_xlatb2 = 0.0<u_xlat16_41;
#endif
        if(u_xlatb2){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + unity_LightPosition[u_xlati_loop_1].xyz;
            u_xlat16_41 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = inversesqrt(u_xlat16_41);
            u_xlat16_10.xyz = vec3(u_xlat16_41) * u_xlat16_10.xyz;
            u_xlat16_41 = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = max(u_xlat16_41, 0.0);
            u_xlat16_41 = log2(u_xlat16_41);
            u_xlat16_41 = u_xlat16_7 * u_xlat16_41;
            u_xlat16_41 = exp2(u_xlat16_41);
            u_xlat16_41 = min(u_xlat16_41, 1.0);
            u_xlat16_41 = u_xlat16_41 * 0.5;
            u_xlat16_8.xyz = vec3(u_xlat16_41) * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        }
        u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR1.xyz = min(max(vs_COLOR1.xyz, 0.0), 1.0);
#else
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.xyz = u_xlat16_18.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Illum;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_COLOR1;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
bool u_xlatb14;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_20;
bool u_xlatb25;
float u_xlat33;
int u_xlati34;
float u_xlat35;
bool u_xlatb35;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat16_7 = _Shininess * 128.0;
    u_xlat16_18.x = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat16_18.z = float(0.0);
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat35 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat3.x = unity_LightAtten[u_xlati_loop_1].z * u_xlat35 + 1.0;
        u_xlat3.x = float(1.0) / u_xlat3.x;
        u_xlatb14 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb25 = unity_LightAtten[u_xlati_loop_1].w<u_xlat35;
        u_xlatb14 = u_xlatb25 && u_xlatb14;
        u_xlat35 = max(u_xlat35, 9.99999997e-07);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat2.xyz = vec3(u_xlat35) * u_xlat2.xyz;
        u_xlat35 = u_xlat3.x * 0.5;
        u_xlat16_41 = (u_xlatb14) ? 0.0 : u_xlat35;
        u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
        u_xlat16_20.xyz = u_xlat16_9.xxx * _Color.xyz;
        u_xlat16_20.xyz = u_xlat16_20.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb35 = 0.0<u_xlat16_9.x;
        if(u_xlatb35){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + u_xlat2.xyz;
            u_xlat16_9.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
            u_xlat16_10.xyz = u_xlat16_9.xxx * u_xlat16_10.xyz;
            u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
            u_xlat16_9.x = log2(u_xlat16_9.x);
            u_xlat16_9.x = u_xlat16_7 * u_xlat16_9.x;
            u_xlat16_9.x = exp2(u_xlat16_9.x);
            u_xlat16_9.x = min(u_xlat16_9.x, 1.0);
            u_xlat16_9.x = u_xlat16_41 * u_xlat16_9.x;
            u_xlat16_8.xyz = u_xlat16_9.xxx * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        }
        u_xlat16_9.xyz = vec3(u_xlat16_41) * u_xlat16_20.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat16_18.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Illum;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0.x = texture2D(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat10_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
bool u_xlatb14;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_20;
bool u_xlatb25;
float u_xlat33;
int u_xlati34;
float u_xlat35;
bool u_xlatb35;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat16_7 = _Shininess * 128.0;
    u_xlat16_18.x = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat16_18.z = float(0.0);
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat35 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat3.x = unity_LightAtten[u_xlati_loop_1].z * u_xlat35 + 1.0;
        u_xlat3.x = float(1.0) / u_xlat3.x;
        u_xlatb14 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb25 = unity_LightAtten[u_xlati_loop_1].w<u_xlat35;
        u_xlatb14 = u_xlatb25 && u_xlatb14;
        u_xlat35 = max(u_xlat35, 9.99999997e-07);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat2.xyz = vec3(u_xlat35) * u_xlat2.xyz;
        u_xlat35 = u_xlat3.x * 0.5;
        u_xlat16_41 = (u_xlatb14) ? 0.0 : u_xlat35;
        u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
        u_xlat16_20.xyz = u_xlat16_9.xxx * _Color.xyz;
        u_xlat16_20.xyz = u_xlat16_20.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb35 = 0.0<u_xlat16_9.x;
        if(u_xlatb35){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + u_xlat2.xyz;
            u_xlat16_9.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
            u_xlat16_10.xyz = u_xlat16_9.xxx * u_xlat16_10.xyz;
            u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
            u_xlat16_9.x = log2(u_xlat16_9.x);
            u_xlat16_9.x = u_xlat16_7 * u_xlat16_9.x;
            u_xlat16_9.x = exp2(u_xlat16_9.x);
            u_xlat16_9.x = min(u_xlat16_9.x, 1.0);
            u_xlat16_9.x = u_xlat16_41 * u_xlat16_9.x;
            u_xlat16_8.xyz = u_xlat16_9.xxx * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        }
        u_xlat16_9.xyz = vec3(u_xlat16_41) * u_xlat16_20.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat16_18.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Illum;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0.x = texture2D(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat10_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
bool u_xlatb14;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_20;
bool u_xlatb25;
float u_xlat33;
int u_xlati34;
float u_xlat35;
bool u_xlatb35;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat16_7 = _Shininess * 128.0;
    u_xlat16_18.x = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat16_18.z = float(0.0);
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat35 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat3.x = unity_LightAtten[u_xlati_loop_1].z * u_xlat35 + 1.0;
        u_xlat3.x = float(1.0) / u_xlat3.x;
        u_xlatb14 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb25 = unity_LightAtten[u_xlati_loop_1].w<u_xlat35;
        u_xlatb14 = u_xlatb25 && u_xlatb14;
        u_xlat35 = max(u_xlat35, 9.99999997e-07);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat2.xyz = vec3(u_xlat35) * u_xlat2.xyz;
        u_xlat35 = u_xlat3.x * 0.5;
        u_xlat16_41 = (u_xlatb14) ? 0.0 : u_xlat35;
        u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
        u_xlat16_20.xyz = u_xlat16_9.xxx * _Color.xyz;
        u_xlat16_20.xyz = u_xlat16_20.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb35 = 0.0<u_xlat16_9.x;
        if(u_xlatb35){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + u_xlat2.xyz;
            u_xlat16_9.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
            u_xlat16_10.xyz = u_xlat16_9.xxx * u_xlat16_10.xyz;
            u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
            u_xlat16_9.x = log2(u_xlat16_9.x);
            u_xlat16_9.x = u_xlat16_7 * u_xlat16_9.x;
            u_xlat16_9.x = exp2(u_xlat16_9.x);
            u_xlat16_9.x = min(u_xlat16_9.x, 1.0);
            u_xlat16_9.x = u_xlat16_41 * u_xlat16_9.x;
            u_xlat16_8.xyz = u_xlat16_9.xxx * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        }
        u_xlat16_9.xyz = vec3(u_xlat16_41) * u_xlat16_20.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat16_18.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Illum;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0.x = texture2D(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat10_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_COLOR1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
bool u_xlatb12;
float u_xlat13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
bool u_xlatb16;
float u_xlat17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat21;
mediump vec3 u_xlat16_22;
int u_xlati24;
bool u_xlatb24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat28;
vec3 u_xlat29;
bool u_xlatb29;
vec3 u_xlat31;
vec3 u_xlat32;
bool u_xlatb32;
vec3 u_xlat35;
vec3 u_xlat36;
bool u_xlatb36;
mediump float u_xlat16_41;
bool u_xlatb43;
mediump float u_xlat16_44;
mediump float u_xlat16_45;
float u_xlat48;
bool u_xlatb48;
float u_xlat51;
bool u_xlatb51;
float u_xlat55;
bool u_xlatb55;
float u_xlat58;
float u_xlat61;
float u_xlat62;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
bool u_xlatb65;
float u_xlat67;
bool u_xlatb68;
float u_xlat70;
bool u_xlatb72;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat19.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat19.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat19.xyz;
    u_xlat19.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat19.xyz;
    u_xlat19.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat19.xyz;
    u_xlat19.xyz = u_xlat19.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat19.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat19.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat19.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat19.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat19.xyz = u_xlat19.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat19.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat58 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat58);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat58;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat58 + 1.0;
    u_xlat58 = max(u_xlat58, 9.99999997e-07);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.5;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat2.x;
    u_xlat2.xyz = vec3(u_xlat58) * u_xlat1.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat4.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat4.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat5.xyz;
    u_xlat4.z = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat16_22.x = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0);
    u_xlat16_6.xyz = u_xlat16_22.xxx * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<u_xlat16_22.x);
#else
    u_xlatb0 = 0.0<u_xlat16_22.x;
#endif
    u_xlat16_22.xyz = u_xlat16_6.xyz * unity_LightColor[1].xyz;
    u_xlat16_22.xyz = u_xlat16_3.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = min(u_xlat16_22.xyz, vec3(1.0, 1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlat21.xyz = (-u_xlat19.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat61 = dot(u_xlat21.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(unity_LightAtten[0].w<u_xlat61);
#else
    u_xlatb5 = unity_LightAtten[0].w<u_xlat61;
#endif
    u_xlatb2 = u_xlatb2 && u_xlatb5;
    u_xlat5.x = unity_LightAtten[0].z * u_xlat61 + 1.0;
    u_xlat61 = max(u_xlat61, 9.99999997e-07);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * 0.5;
    u_xlat16_6.x = (u_xlatb2) ? 0.0 : u_xlat5.x;
    u_xlat5.xyz = u_xlat21.xyz * vec3(u_xlat61);
    u_xlat16_25.x = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat16_25.x = max(u_xlat16_25.x, 0.0);
    u_xlat16_7.xyz = u_xlat16_25.xxx * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<u_xlat16_25.x);
#else
    u_xlatb2 = 0.0<u_xlat16_25.x;
#endif
    u_xlat16_25.xyz = u_xlat16_7.xyz * unity_LightColor[0].xyz;
    u_xlat16_25.xyz = u_xlat16_6.xxx * u_xlat16_25.xyz;
    u_xlat16_25.xyz = min(u_xlat16_25.xyz, vec3(1.0, 1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb5 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_25.xyz = (bool(u_xlatb5)) ? u_xlat16_25.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_22.xyz = u_xlat16_22.xyz + u_xlat16_25.xyz;
    u_xlati24 = u_xlatb5 ? 1 : int(0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb43 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb43 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlati24 = (u_xlatb43) ? 2 : u_xlati24;
    u_xlat16_22.xyz = (bool(u_xlatb43)) ? u_xlat16_22.xyz : u_xlat16_25.xyz;
    u_xlat8.xyz = (-u_xlat19.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat62 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(unity_LightAtten[2].w<u_xlat62);
#else
    u_xlatb65 = unity_LightAtten[2].w<u_xlat62;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb9 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb65 = u_xlatb65 && u_xlatb9;
    u_xlat9.x = unity_LightAtten[2].z * u_xlat62 + 1.0;
    u_xlat62 = max(u_xlat62, 9.99999997e-07);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat9.x = float(1.0) / u_xlat9.x;
    u_xlat9.x = u_xlat9.x * 0.5;
    u_xlat16_25.x = (u_xlatb65) ? 0.0 : u_xlat9.x;
    u_xlat9.xyz = vec3(u_xlat62) * u_xlat8.xyz;
    u_xlat16_44 = dot(u_xlat4.xyz, u_xlat9.xyz);
    u_xlat16_44 = max(u_xlat16_44, 0.0);
    u_xlat16_7.xyz = vec3(u_xlat16_44) * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(0.0<u_xlat16_44);
#else
    u_xlatb65 = 0.0<u_xlat16_44;
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * unity_LightColor[2].xyz;
    u_xlat16_7.xyz = u_xlat16_25.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = min(u_xlat16_7.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_7.xyz = u_xlat16_22.xyz + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb9 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb9 = u_xlatb43 && u_xlatb9;
    u_xlat16_22.xyz = (bool(u_xlatb9)) ? u_xlat16_7.xyz : u_xlat16_22.xyz;
    u_xlat28.xyz = (-u_xlat19.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat10 = dot(u_xlat28.xyz, u_xlat28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(unity_LightAtten[3].w<u_xlat10);
#else
    u_xlatb29 = unity_LightAtten[3].w<u_xlat10;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb48 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb29 = u_xlatb29 && u_xlatb48;
    u_xlat48 = unity_LightAtten[3].z * u_xlat10 + 1.0;
    u_xlat10 = max(u_xlat10, 9.99999997e-07);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat48 = float(1.0) / u_xlat48;
    u_xlat48 = u_xlat48 * 0.5;
    u_xlat16_44 = (u_xlatb29) ? 0.0 : u_xlat48;
    u_xlat29.xyz = u_xlat28.xyz * vec3(u_xlat10);
    u_xlat16_63 = dot(u_xlat4.xyz, u_xlat29.xyz);
    u_xlat16_63 = max(u_xlat16_63, 0.0);
    u_xlat16_7.xyz = vec3(u_xlat16_63) * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.0<u_xlat16_63);
#else
    u_xlatb29 = 0.0<u_xlat16_63;
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * unity_LightColor[3].xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_44) * u_xlat16_7.xyz;
    u_xlat16_7.xyz = min(u_xlat16_7.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_7.xyz = u_xlat16_22.xyz + u_xlat16_7.xyz;
    u_xlati24 = (u_xlatb9) ? 3 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb48 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb48 = u_xlatb9 && u_xlatb48;
    u_xlat16_22.xyz = (bool(u_xlatb48)) ? u_xlat16_7.xyz : u_xlat16_22.xyz;
    u_xlat11.xyz = (-u_xlat19.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat67 = dot(u_xlat11.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(unity_LightAtten[4].w<u_xlat67);
#else
    u_xlatb68 = unity_LightAtten[4].w<u_xlat67;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb12 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb68 = u_xlatb68 && u_xlatb12;
    u_xlat12.x = unity_LightAtten[4].z * u_xlat67 + 1.0;
    u_xlat67 = max(u_xlat67, 9.99999997e-07);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat12.x = u_xlat12.x * 0.5;
    u_xlat16_63 = (u_xlatb68) ? 0.0 : u_xlat12.x;
    u_xlat12.xyz = vec3(u_xlat67) * u_xlat11.xyz;
    u_xlat16_7.x = dot(u_xlat4.xyz, u_xlat12.xyz);
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_26.xyz = u_xlat16_7.xxx * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.0<u_xlat16_7.x);
#else
    u_xlatb68 = 0.0<u_xlat16_7.x;
#endif
    u_xlat16_7.xyz = u_xlat16_26.xyz * unity_LightColor[4].xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_63) * u_xlat16_7.xyz;
    u_xlat16_7.xyz = min(u_xlat16_7.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_7.xyz = u_xlat16_22.xyz + u_xlat16_7.xyz;
    u_xlati24 = (u_xlatb48) ? 4 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb12 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb12 = u_xlatb48 && u_xlatb12;
    u_xlat16_22.xyz = (bool(u_xlatb12)) ? u_xlat16_7.xyz : u_xlat16_22.xyz;
    u_xlat31.xyz = (-u_xlat19.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat13 = dot(u_xlat31.xyz, u_xlat31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(unity_LightAtten[5].w<u_xlat13);
#else
    u_xlatb32 = unity_LightAtten[5].w<u_xlat13;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb51 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb32 = u_xlatb32 && u_xlatb51;
    u_xlat51 = unity_LightAtten[5].z * u_xlat13 + 1.0;
    u_xlat13 = max(u_xlat13, 9.99999997e-07);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat51 = float(1.0) / u_xlat51;
    u_xlat51 = u_xlat51 * 0.5;
    u_xlat16_7.x = (u_xlatb32) ? 0.0 : u_xlat51;
    u_xlat32.xyz = u_xlat31.xyz * vec3(u_xlat13);
    u_xlat16_26.x = dot(u_xlat4.xyz, u_xlat32.xyz);
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0);
    u_xlat16_14.xyz = u_xlat16_26.xxx * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(0.0<u_xlat16_26.x);
#else
    u_xlatb32 = 0.0<u_xlat16_26.x;
#endif
    u_xlat16_26.xyz = u_xlat16_14.xyz * unity_LightColor[5].xyz;
    u_xlat16_26.xyz = u_xlat16_7.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = min(u_xlat16_26.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_26.xyz = u_xlat16_22.xyz + u_xlat16_26.xyz;
    u_xlati24 = (u_xlatb12) ? 5 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb51 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb51 = u_xlatb12 && u_xlatb51;
    u_xlat16_22.xyz = (bool(u_xlatb51)) ? u_xlat16_26.xyz : u_xlat16_22.xyz;
    u_xlat15.xyz = (-u_xlat19.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat70 = dot(u_xlat15.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(unity_LightAtten[6].w<u_xlat70);
#else
    u_xlatb72 = unity_LightAtten[6].w<u_xlat70;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb16 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb72 = u_xlatb72 && u_xlatb16;
    u_xlat16.x = unity_LightAtten[6].z * u_xlat70 + 1.0;
    u_xlat70 = max(u_xlat70, 9.99999997e-07);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat16.x = float(1.0) / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.5;
    u_xlat16_26.x = (u_xlatb72) ? 0.0 : u_xlat16.x;
    u_xlat16.xyz = vec3(u_xlat70) * u_xlat15.xyz;
    u_xlat16_45 = dot(u_xlat4.xyz, u_xlat16.xyz);
    u_xlat16_45 = max(u_xlat16_45, 0.0);
    u_xlat16_14.xyz = vec3(u_xlat16_45) * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(0.0<u_xlat16_45);
#else
    u_xlatb72 = 0.0<u_xlat16_45;
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz * unity_LightColor[6].xyz;
    u_xlat16_14.xyz = u_xlat16_26.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = min(u_xlat16_14.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_14.xyz = u_xlat16_22.xyz + u_xlat16_14.xyz;
    u_xlati24 = (u_xlatb51) ? 6 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb16 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb16 = u_xlatb51 && u_xlatb16;
    u_xlat16_22.xyz = (bool(u_xlatb16)) ? u_xlat16_14.xyz : u_xlat16_22.xyz;
    u_xlat35.xyz = (-u_xlat19.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat17 = dot(u_xlat35.xyz, u_xlat35.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(unity_LightAtten[7].w<u_xlat17);
#else
    u_xlatb36 = unity_LightAtten[7].w<u_xlat17;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb55 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb36 = u_xlatb36 && u_xlatb55;
    u_xlat55 = unity_LightAtten[7].z * u_xlat17 + 1.0;
    u_xlat17 = max(u_xlat17, 9.99999997e-07);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat55 = float(1.0) / u_xlat55;
    u_xlat55 = u_xlat55 * 0.5;
    u_xlat16_45 = (u_xlatb36) ? 0.0 : u_xlat55;
    u_xlat36.xyz = u_xlat35.xyz * vec3(u_xlat17);
    u_xlat16_64 = dot(u_xlat4.xyz, u_xlat36.xyz);
    u_xlat16_64 = max(u_xlat16_64, 0.0);
    u_xlat16_14.xyz = vec3(u_xlat16_64) * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<u_xlat16_64);
#else
    u_xlatb36 = 0.0<u_xlat16_64;
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz * unity_LightColor[7].xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_45) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = min(u_xlat16_14.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_14.xyz = u_xlat16_22.xyz + u_xlat16_14.xyz;
    u_xlati24 = (u_xlatb16) ? 7 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb24 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb24 = u_xlatb24 && u_xlatb16;
    vs_COLOR0.xyz = (bool(u_xlatb24)) ? u_xlat16_14.xyz : u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    u_xlat55 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat19.xyz = u_xlat19.xyz * vec3(u_xlat55);
    u_xlat16_22.xyz = u_xlat21.xyz * vec3(u_xlat61) + (-u_xlat19.xyz);
    u_xlat16_64 = dot(u_xlat16_22.xyz, u_xlat16_22.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(u_xlat16_64);
    u_xlat16_22.x = dot(u_xlat4.xyz, u_xlat16_22.xyz);
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0);
    u_xlat16_22.x = log2(u_xlat16_22.x);
    u_xlat16_41 = _Shininess * 128.0;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_41;
    u_xlat16_22.x = exp2(u_xlat16_22.x);
    u_xlat16_22.x = min(u_xlat16_22.x, 1.0);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_6.x;
    u_xlat16_14.xyz = u_xlat16_22.xxx * unity_LightColor[0].xyz;
    u_xlat16_14.xyz = (bool(u_xlatb2)) ? u_xlat16_14.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_14.xyz = (bool(u_xlatb5)) ? u_xlat16_14.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_18.xyz = u_xlat1.xyz * vec3(u_xlat58) + (-u_xlat19.xyz);
    u_xlat16_22.x = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_22.x = inversesqrt(u_xlat16_22.x);
    u_xlat16_18.xyz = u_xlat16_22.xxx * u_xlat16_18.xyz;
    u_xlat16_22.x = dot(u_xlat4.xyz, u_xlat16_18.xyz);
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0);
    u_xlat16_22.x = log2(u_xlat16_22.x);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_41;
    u_xlat16_22.x = exp2(u_xlat16_22.x);
    u_xlat16_22.x = min(u_xlat16_22.x, 1.0);
    u_xlat16_3.x = u_xlat16_22.x * u_xlat16_3.x;
    u_xlat16_3.xyw = u_xlat16_3.xxx * unity_LightColor[1].xyz + u_xlat16_14.xyz;
    u_xlat16_3.xyw = (bool(u_xlatb0)) ? u_xlat16_3.xyw : u_xlat16_14.xyz;
    u_xlat16_3.xyw = (bool(u_xlatb43)) ? u_xlat16_3.xyw : u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat8.xyz * vec3(u_xlat62) + (-u_xlat19.xyz);
    u_xlat16_6.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_14.xyz = u_xlat16_6.xxx * u_xlat16_14.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_25.x;
    u_xlat16_14.xyz = u_xlat16_6.xxx * unity_LightColor[2].xyz + u_xlat16_3.xyw;
    u_xlat16_14.xyz = (bool(u_xlatb65)) ? u_xlat16_14.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb9)) ? u_xlat16_14.xyz : u_xlat16_3.xyw;
    u_xlat16_14.xyz = u_xlat28.xyz * vec3(u_xlat10) + (-u_xlat19.xyz);
    u_xlat16_6.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_14.xyz = u_xlat16_6.xxx * u_xlat16_14.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_44;
    u_xlat16_6.xyz = u_xlat16_6.xxx * unity_LightColor[3].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb29)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb48)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_6.xyz = u_xlat11.xyz * vec3(u_xlat67) + (-u_xlat19.xyz);
    u_xlat16_64 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat16_64);
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_6.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_63;
    u_xlat16_6.xyz = u_xlat16_6.xxx * unity_LightColor[4].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb68)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb12)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_6.xyz = u_xlat31.xyz * vec3(u_xlat13) + (-u_xlat19.xyz);
    u_xlat16_63 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_6.xyz = vec3(u_xlat16_63) * u_xlat16_6.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_6.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_7.x;
    u_xlat16_6.xyz = u_xlat16_6.xxx * unity_LightColor[5].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb32)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb51)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_6.xyz = u_xlat15.xyz * vec3(u_xlat70) + (-u_xlat19.xyz);
    u_xlat16_14.xyz = u_xlat35.xyz * vec3(u_xlat17) + (-u_xlat19.xyz);
    u_xlat16_63 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_6.xyz = vec3(u_xlat16_63) * u_xlat16_6.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_6.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_26.x;
    u_xlat16_6.xyz = u_xlat16_6.xxx * unity_LightColor[6].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb72)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb16)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_6.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_14.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_6.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_41 = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_41 = exp2(u_xlat16_41);
    u_xlat16_41 = min(u_xlat16_41, 1.0);
    u_xlat16_41 = u_xlat16_41 * u_xlat16_45;
    u_xlat16_6.xyz = vec3(u_xlat16_41) * unity_LightColor[7].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb36)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyz = (bool(u_xlatb24)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    vs_COLOR1.xyz = u_xlat16_3.xyz * _SpecColor.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR1.xyz = min(max(vs_COLOR1.xyz, 0.0), 1.0);
#else
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Illum;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_COLOR1;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_COLOR1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
bool u_xlatb12;
float u_xlat13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
bool u_xlatb16;
float u_xlat17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat21;
mediump vec3 u_xlat16_22;
int u_xlati24;
bool u_xlatb24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat28;
vec3 u_xlat29;
bool u_xlatb29;
vec3 u_xlat31;
vec3 u_xlat32;
bool u_xlatb32;
vec3 u_xlat35;
vec3 u_xlat36;
bool u_xlatb36;
mediump float u_xlat16_41;
bool u_xlatb43;
mediump float u_xlat16_44;
mediump float u_xlat16_45;
float u_xlat48;
bool u_xlatb48;
float u_xlat51;
bool u_xlatb51;
float u_xlat55;
bool u_xlatb55;
float u_xlat58;
float u_xlat61;
float u_xlat62;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
bool u_xlatb65;
float u_xlat67;
bool u_xlatb68;
float u_xlat70;
bool u_xlatb72;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat19.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat19.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat19.xyz;
    u_xlat19.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat19.xyz;
    u_xlat19.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat19.xyz;
    u_xlat19.xyz = u_xlat19.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat19.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat19.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat19.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat19.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat19.xyz = u_xlat19.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat19.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat58 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat58);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat58;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat58 + 1.0;
    u_xlat58 = max(u_xlat58, 9.99999997e-07);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.5;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat2.x;
    u_xlat2.xyz = vec3(u_xlat58) * u_xlat1.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat4.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat4.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat5.xyz;
    u_xlat4.z = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat16_22.x = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0);
    u_xlat16_6.xyz = u_xlat16_22.xxx * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<u_xlat16_22.x);
#else
    u_xlatb0 = 0.0<u_xlat16_22.x;
#endif
    u_xlat16_22.xyz = u_xlat16_6.xyz * unity_LightColor[1].xyz;
    u_xlat16_22.xyz = u_xlat16_3.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = min(u_xlat16_22.xyz, vec3(1.0, 1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlat21.xyz = (-u_xlat19.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat61 = dot(u_xlat21.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(unity_LightAtten[0].w<u_xlat61);
#else
    u_xlatb5 = unity_LightAtten[0].w<u_xlat61;
#endif
    u_xlatb2 = u_xlatb2 && u_xlatb5;
    u_xlat5.x = unity_LightAtten[0].z * u_xlat61 + 1.0;
    u_xlat61 = max(u_xlat61, 9.99999997e-07);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * 0.5;
    u_xlat16_6.x = (u_xlatb2) ? 0.0 : u_xlat5.x;
    u_xlat5.xyz = u_xlat21.xyz * vec3(u_xlat61);
    u_xlat16_25.x = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat16_25.x = max(u_xlat16_25.x, 0.0);
    u_xlat16_7.xyz = u_xlat16_25.xxx * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<u_xlat16_25.x);
#else
    u_xlatb2 = 0.0<u_xlat16_25.x;
#endif
    u_xlat16_25.xyz = u_xlat16_7.xyz * unity_LightColor[0].xyz;
    u_xlat16_25.xyz = u_xlat16_6.xxx * u_xlat16_25.xyz;
    u_xlat16_25.xyz = min(u_xlat16_25.xyz, vec3(1.0, 1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb5 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_25.xyz = (bool(u_xlatb5)) ? u_xlat16_25.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_22.xyz = u_xlat16_22.xyz + u_xlat16_25.xyz;
    u_xlati24 = u_xlatb5 ? 1 : int(0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb43 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb43 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlati24 = (u_xlatb43) ? 2 : u_xlati24;
    u_xlat16_22.xyz = (bool(u_xlatb43)) ? u_xlat16_22.xyz : u_xlat16_25.xyz;
    u_xlat8.xyz = (-u_xlat19.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat62 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(unity_LightAtten[2].w<u_xlat62);
#else
    u_xlatb65 = unity_LightAtten[2].w<u_xlat62;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb9 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb65 = u_xlatb65 && u_xlatb9;
    u_xlat9.x = unity_LightAtten[2].z * u_xlat62 + 1.0;
    u_xlat62 = max(u_xlat62, 9.99999997e-07);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat9.x = float(1.0) / u_xlat9.x;
    u_xlat9.x = u_xlat9.x * 0.5;
    u_xlat16_25.x = (u_xlatb65) ? 0.0 : u_xlat9.x;
    u_xlat9.xyz = vec3(u_xlat62) * u_xlat8.xyz;
    u_xlat16_44 = dot(u_xlat4.xyz, u_xlat9.xyz);
    u_xlat16_44 = max(u_xlat16_44, 0.0);
    u_xlat16_7.xyz = vec3(u_xlat16_44) * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(0.0<u_xlat16_44);
#else
    u_xlatb65 = 0.0<u_xlat16_44;
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * unity_LightColor[2].xyz;
    u_xlat16_7.xyz = u_xlat16_25.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = min(u_xlat16_7.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_7.xyz = u_xlat16_22.xyz + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb9 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb9 = u_xlatb43 && u_xlatb9;
    u_xlat16_22.xyz = (bool(u_xlatb9)) ? u_xlat16_7.xyz : u_xlat16_22.xyz;
    u_xlat28.xyz = (-u_xlat19.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat10 = dot(u_xlat28.xyz, u_xlat28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(unity_LightAtten[3].w<u_xlat10);
#else
    u_xlatb29 = unity_LightAtten[3].w<u_xlat10;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb48 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb29 = u_xlatb29 && u_xlatb48;
    u_xlat48 = unity_LightAtten[3].z * u_xlat10 + 1.0;
    u_xlat10 = max(u_xlat10, 9.99999997e-07);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat48 = float(1.0) / u_xlat48;
    u_xlat48 = u_xlat48 * 0.5;
    u_xlat16_44 = (u_xlatb29) ? 0.0 : u_xlat48;
    u_xlat29.xyz = u_xlat28.xyz * vec3(u_xlat10);
    u_xlat16_63 = dot(u_xlat4.xyz, u_xlat29.xyz);
    u_xlat16_63 = max(u_xlat16_63, 0.0);
    u_xlat16_7.xyz = vec3(u_xlat16_63) * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.0<u_xlat16_63);
#else
    u_xlatb29 = 0.0<u_xlat16_63;
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * unity_LightColor[3].xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_44) * u_xlat16_7.xyz;
    u_xlat16_7.xyz = min(u_xlat16_7.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_7.xyz = u_xlat16_22.xyz + u_xlat16_7.xyz;
    u_xlati24 = (u_xlatb9) ? 3 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb48 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb48 = u_xlatb9 && u_xlatb48;
    u_xlat16_22.xyz = (bool(u_xlatb48)) ? u_xlat16_7.xyz : u_xlat16_22.xyz;
    u_xlat11.xyz = (-u_xlat19.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat67 = dot(u_xlat11.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(unity_LightAtten[4].w<u_xlat67);
#else
    u_xlatb68 = unity_LightAtten[4].w<u_xlat67;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb12 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb68 = u_xlatb68 && u_xlatb12;
    u_xlat12.x = unity_LightAtten[4].z * u_xlat67 + 1.0;
    u_xlat67 = max(u_xlat67, 9.99999997e-07);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat12.x = u_xlat12.x * 0.5;
    u_xlat16_63 = (u_xlatb68) ? 0.0 : u_xlat12.x;
    u_xlat12.xyz = vec3(u_xlat67) * u_xlat11.xyz;
    u_xlat16_7.x = dot(u_xlat4.xyz, u_xlat12.xyz);
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_26.xyz = u_xlat16_7.xxx * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.0<u_xlat16_7.x);
#else
    u_xlatb68 = 0.0<u_xlat16_7.x;
#endif
    u_xlat16_7.xyz = u_xlat16_26.xyz * unity_LightColor[4].xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_63) * u_xlat16_7.xyz;
    u_xlat16_7.xyz = min(u_xlat16_7.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_7.xyz = u_xlat16_22.xyz + u_xlat16_7.xyz;
    u_xlati24 = (u_xlatb48) ? 4 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb12 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb12 = u_xlatb48 && u_xlatb12;
    u_xlat16_22.xyz = (bool(u_xlatb12)) ? u_xlat16_7.xyz : u_xlat16_22.xyz;
    u_xlat31.xyz = (-u_xlat19.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat13 = dot(u_xlat31.xyz, u_xlat31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(unity_LightAtten[5].w<u_xlat13);
#else
    u_xlatb32 = unity_LightAtten[5].w<u_xlat13;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb51 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb32 = u_xlatb32 && u_xlatb51;
    u_xlat51 = unity_LightAtten[5].z * u_xlat13 + 1.0;
    u_xlat13 = max(u_xlat13, 9.99999997e-07);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat51 = float(1.0) / u_xlat51;
    u_xlat51 = u_xlat51 * 0.5;
    u_xlat16_7.x = (u_xlatb32) ? 0.0 : u_xlat51;
    u_xlat32.xyz = u_xlat31.xyz * vec3(u_xlat13);
    u_xlat16_26.x = dot(u_xlat4.xyz, u_xlat32.xyz);
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0);
    u_xlat16_14.xyz = u_xlat16_26.xxx * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(0.0<u_xlat16_26.x);
#else
    u_xlatb32 = 0.0<u_xlat16_26.x;
#endif
    u_xlat16_26.xyz = u_xlat16_14.xyz * unity_LightColor[5].xyz;
    u_xlat16_26.xyz = u_xlat16_7.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = min(u_xlat16_26.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_26.xyz = u_xlat16_22.xyz + u_xlat16_26.xyz;
    u_xlati24 = (u_xlatb12) ? 5 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb51 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb51 = u_xlatb12 && u_xlatb51;
    u_xlat16_22.xyz = (bool(u_xlatb51)) ? u_xlat16_26.xyz : u_xlat16_22.xyz;
    u_xlat15.xyz = (-u_xlat19.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat70 = dot(u_xlat15.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(unity_LightAtten[6].w<u_xlat70);
#else
    u_xlatb72 = unity_LightAtten[6].w<u_xlat70;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb16 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb72 = u_xlatb72 && u_xlatb16;
    u_xlat16.x = unity_LightAtten[6].z * u_xlat70 + 1.0;
    u_xlat70 = max(u_xlat70, 9.99999997e-07);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat16.x = float(1.0) / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.5;
    u_xlat16_26.x = (u_xlatb72) ? 0.0 : u_xlat16.x;
    u_xlat16.xyz = vec3(u_xlat70) * u_xlat15.xyz;
    u_xlat16_45 = dot(u_xlat4.xyz, u_xlat16.xyz);
    u_xlat16_45 = max(u_xlat16_45, 0.0);
    u_xlat16_14.xyz = vec3(u_xlat16_45) * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(0.0<u_xlat16_45);
#else
    u_xlatb72 = 0.0<u_xlat16_45;
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz * unity_LightColor[6].xyz;
    u_xlat16_14.xyz = u_xlat16_26.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = min(u_xlat16_14.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_14.xyz = u_xlat16_22.xyz + u_xlat16_14.xyz;
    u_xlati24 = (u_xlatb51) ? 6 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb16 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb16 = u_xlatb51 && u_xlatb16;
    u_xlat16_22.xyz = (bool(u_xlatb16)) ? u_xlat16_14.xyz : u_xlat16_22.xyz;
    u_xlat35.xyz = (-u_xlat19.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat17 = dot(u_xlat35.xyz, u_xlat35.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(unity_LightAtten[7].w<u_xlat17);
#else
    u_xlatb36 = unity_LightAtten[7].w<u_xlat17;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb55 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb36 = u_xlatb36 && u_xlatb55;
    u_xlat55 = unity_LightAtten[7].z * u_xlat17 + 1.0;
    u_xlat17 = max(u_xlat17, 9.99999997e-07);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat55 = float(1.0) / u_xlat55;
    u_xlat55 = u_xlat55 * 0.5;
    u_xlat16_45 = (u_xlatb36) ? 0.0 : u_xlat55;
    u_xlat36.xyz = u_xlat35.xyz * vec3(u_xlat17);
    u_xlat16_64 = dot(u_xlat4.xyz, u_xlat36.xyz);
    u_xlat16_64 = max(u_xlat16_64, 0.0);
    u_xlat16_14.xyz = vec3(u_xlat16_64) * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<u_xlat16_64);
#else
    u_xlatb36 = 0.0<u_xlat16_64;
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz * unity_LightColor[7].xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_45) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = min(u_xlat16_14.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_14.xyz = u_xlat16_22.xyz + u_xlat16_14.xyz;
    u_xlati24 = (u_xlatb16) ? 7 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb24 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb24 = u_xlatb24 && u_xlatb16;
    vs_COLOR0.xyz = (bool(u_xlatb24)) ? u_xlat16_14.xyz : u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    u_xlat55 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat19.xyz = u_xlat19.xyz * vec3(u_xlat55);
    u_xlat16_22.xyz = u_xlat21.xyz * vec3(u_xlat61) + (-u_xlat19.xyz);
    u_xlat16_64 = dot(u_xlat16_22.xyz, u_xlat16_22.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(u_xlat16_64);
    u_xlat16_22.x = dot(u_xlat4.xyz, u_xlat16_22.xyz);
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0);
    u_xlat16_22.x = log2(u_xlat16_22.x);
    u_xlat16_41 = _Shininess * 128.0;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_41;
    u_xlat16_22.x = exp2(u_xlat16_22.x);
    u_xlat16_22.x = min(u_xlat16_22.x, 1.0);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_6.x;
    u_xlat16_14.xyz = u_xlat16_22.xxx * unity_LightColor[0].xyz;
    u_xlat16_14.xyz = (bool(u_xlatb2)) ? u_xlat16_14.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_14.xyz = (bool(u_xlatb5)) ? u_xlat16_14.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_18.xyz = u_xlat1.xyz * vec3(u_xlat58) + (-u_xlat19.xyz);
    u_xlat16_22.x = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_22.x = inversesqrt(u_xlat16_22.x);
    u_xlat16_18.xyz = u_xlat16_22.xxx * u_xlat16_18.xyz;
    u_xlat16_22.x = dot(u_xlat4.xyz, u_xlat16_18.xyz);
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0);
    u_xlat16_22.x = log2(u_xlat16_22.x);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_41;
    u_xlat16_22.x = exp2(u_xlat16_22.x);
    u_xlat16_22.x = min(u_xlat16_22.x, 1.0);
    u_xlat16_3.x = u_xlat16_22.x * u_xlat16_3.x;
    u_xlat16_3.xyw = u_xlat16_3.xxx * unity_LightColor[1].xyz + u_xlat16_14.xyz;
    u_xlat16_3.xyw = (bool(u_xlatb0)) ? u_xlat16_3.xyw : u_xlat16_14.xyz;
    u_xlat16_3.xyw = (bool(u_xlatb43)) ? u_xlat16_3.xyw : u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat8.xyz * vec3(u_xlat62) + (-u_xlat19.xyz);
    u_xlat16_6.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_14.xyz = u_xlat16_6.xxx * u_xlat16_14.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_25.x;
    u_xlat16_14.xyz = u_xlat16_6.xxx * unity_LightColor[2].xyz + u_xlat16_3.xyw;
    u_xlat16_14.xyz = (bool(u_xlatb65)) ? u_xlat16_14.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb9)) ? u_xlat16_14.xyz : u_xlat16_3.xyw;
    u_xlat16_14.xyz = u_xlat28.xyz * vec3(u_xlat10) + (-u_xlat19.xyz);
    u_xlat16_6.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_14.xyz = u_xlat16_6.xxx * u_xlat16_14.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_44;
    u_xlat16_6.xyz = u_xlat16_6.xxx * unity_LightColor[3].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb29)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb48)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_6.xyz = u_xlat11.xyz * vec3(u_xlat67) + (-u_xlat19.xyz);
    u_xlat16_64 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat16_64);
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_6.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_63;
    u_xlat16_6.xyz = u_xlat16_6.xxx * unity_LightColor[4].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb68)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb12)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_6.xyz = u_xlat31.xyz * vec3(u_xlat13) + (-u_xlat19.xyz);
    u_xlat16_63 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_6.xyz = vec3(u_xlat16_63) * u_xlat16_6.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_6.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_7.x;
    u_xlat16_6.xyz = u_xlat16_6.xxx * unity_LightColor[5].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb32)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb51)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_6.xyz = u_xlat15.xyz * vec3(u_xlat70) + (-u_xlat19.xyz);
    u_xlat16_14.xyz = u_xlat35.xyz * vec3(u_xlat17) + (-u_xlat19.xyz);
    u_xlat16_63 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_6.xyz = vec3(u_xlat16_63) * u_xlat16_6.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_6.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_26.x;
    u_xlat16_6.xyz = u_xlat16_6.xxx * unity_LightColor[6].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb72)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb16)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_6.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_14.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_6.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_41 = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_41 = exp2(u_xlat16_41);
    u_xlat16_41 = min(u_xlat16_41, 1.0);
    u_xlat16_41 = u_xlat16_41 * u_xlat16_45;
    u_xlat16_6.xyz = vec3(u_xlat16_41) * unity_LightColor[7].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb36)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyz = (bool(u_xlatb24)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    vs_COLOR1.xyz = u_xlat16_3.xyz * _SpecColor.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR1.xyz = min(max(vs_COLOR1.xyz, 0.0), 1.0);
#else
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Illum;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_COLOR1;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_COLOR1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
bool u_xlatb12;
float u_xlat13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
bool u_xlatb16;
float u_xlat17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat21;
mediump vec3 u_xlat16_22;
int u_xlati24;
bool u_xlatb24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat28;
vec3 u_xlat29;
bool u_xlatb29;
vec3 u_xlat31;
vec3 u_xlat32;
bool u_xlatb32;
vec3 u_xlat35;
vec3 u_xlat36;
bool u_xlatb36;
mediump float u_xlat16_41;
bool u_xlatb43;
mediump float u_xlat16_44;
mediump float u_xlat16_45;
float u_xlat48;
bool u_xlatb48;
float u_xlat51;
bool u_xlatb51;
float u_xlat55;
bool u_xlatb55;
float u_xlat58;
float u_xlat61;
float u_xlat62;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
bool u_xlatb65;
float u_xlat67;
bool u_xlatb68;
float u_xlat70;
bool u_xlatb72;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat19.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat19.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat19.xyz;
    u_xlat19.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat19.xyz;
    u_xlat19.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat19.xyz;
    u_xlat19.xyz = u_xlat19.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat19.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat19.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat19.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat19.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat19.xyz = u_xlat19.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat19.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat58 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat58);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat58;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat58 + 1.0;
    u_xlat58 = max(u_xlat58, 9.99999997e-07);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.5;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat2.x;
    u_xlat2.xyz = vec3(u_xlat58) * u_xlat1.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat4.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat4.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat5.xyz;
    u_xlat4.z = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat16_22.x = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0);
    u_xlat16_6.xyz = u_xlat16_22.xxx * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<u_xlat16_22.x);
#else
    u_xlatb0 = 0.0<u_xlat16_22.x;
#endif
    u_xlat16_22.xyz = u_xlat16_6.xyz * unity_LightColor[1].xyz;
    u_xlat16_22.xyz = u_xlat16_3.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = min(u_xlat16_22.xyz, vec3(1.0, 1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlat21.xyz = (-u_xlat19.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat61 = dot(u_xlat21.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(unity_LightAtten[0].w<u_xlat61);
#else
    u_xlatb5 = unity_LightAtten[0].w<u_xlat61;
#endif
    u_xlatb2 = u_xlatb2 && u_xlatb5;
    u_xlat5.x = unity_LightAtten[0].z * u_xlat61 + 1.0;
    u_xlat61 = max(u_xlat61, 9.99999997e-07);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * 0.5;
    u_xlat16_6.x = (u_xlatb2) ? 0.0 : u_xlat5.x;
    u_xlat5.xyz = u_xlat21.xyz * vec3(u_xlat61);
    u_xlat16_25.x = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat16_25.x = max(u_xlat16_25.x, 0.0);
    u_xlat16_7.xyz = u_xlat16_25.xxx * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<u_xlat16_25.x);
#else
    u_xlatb2 = 0.0<u_xlat16_25.x;
#endif
    u_xlat16_25.xyz = u_xlat16_7.xyz * unity_LightColor[0].xyz;
    u_xlat16_25.xyz = u_xlat16_6.xxx * u_xlat16_25.xyz;
    u_xlat16_25.xyz = min(u_xlat16_25.xyz, vec3(1.0, 1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb5 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_25.xyz = (bool(u_xlatb5)) ? u_xlat16_25.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_22.xyz = u_xlat16_22.xyz + u_xlat16_25.xyz;
    u_xlati24 = u_xlatb5 ? 1 : int(0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb43 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb43 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlati24 = (u_xlatb43) ? 2 : u_xlati24;
    u_xlat16_22.xyz = (bool(u_xlatb43)) ? u_xlat16_22.xyz : u_xlat16_25.xyz;
    u_xlat8.xyz = (-u_xlat19.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat62 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(unity_LightAtten[2].w<u_xlat62);
#else
    u_xlatb65 = unity_LightAtten[2].w<u_xlat62;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb9 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb65 = u_xlatb65 && u_xlatb9;
    u_xlat9.x = unity_LightAtten[2].z * u_xlat62 + 1.0;
    u_xlat62 = max(u_xlat62, 9.99999997e-07);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat9.x = float(1.0) / u_xlat9.x;
    u_xlat9.x = u_xlat9.x * 0.5;
    u_xlat16_25.x = (u_xlatb65) ? 0.0 : u_xlat9.x;
    u_xlat9.xyz = vec3(u_xlat62) * u_xlat8.xyz;
    u_xlat16_44 = dot(u_xlat4.xyz, u_xlat9.xyz);
    u_xlat16_44 = max(u_xlat16_44, 0.0);
    u_xlat16_7.xyz = vec3(u_xlat16_44) * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(0.0<u_xlat16_44);
#else
    u_xlatb65 = 0.0<u_xlat16_44;
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * unity_LightColor[2].xyz;
    u_xlat16_7.xyz = u_xlat16_25.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = min(u_xlat16_7.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_7.xyz = u_xlat16_22.xyz + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb9 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb9 = u_xlatb43 && u_xlatb9;
    u_xlat16_22.xyz = (bool(u_xlatb9)) ? u_xlat16_7.xyz : u_xlat16_22.xyz;
    u_xlat28.xyz = (-u_xlat19.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat10 = dot(u_xlat28.xyz, u_xlat28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(unity_LightAtten[3].w<u_xlat10);
#else
    u_xlatb29 = unity_LightAtten[3].w<u_xlat10;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb48 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb29 = u_xlatb29 && u_xlatb48;
    u_xlat48 = unity_LightAtten[3].z * u_xlat10 + 1.0;
    u_xlat10 = max(u_xlat10, 9.99999997e-07);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat48 = float(1.0) / u_xlat48;
    u_xlat48 = u_xlat48 * 0.5;
    u_xlat16_44 = (u_xlatb29) ? 0.0 : u_xlat48;
    u_xlat29.xyz = u_xlat28.xyz * vec3(u_xlat10);
    u_xlat16_63 = dot(u_xlat4.xyz, u_xlat29.xyz);
    u_xlat16_63 = max(u_xlat16_63, 0.0);
    u_xlat16_7.xyz = vec3(u_xlat16_63) * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.0<u_xlat16_63);
#else
    u_xlatb29 = 0.0<u_xlat16_63;
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * unity_LightColor[3].xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_44) * u_xlat16_7.xyz;
    u_xlat16_7.xyz = min(u_xlat16_7.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_7.xyz = u_xlat16_22.xyz + u_xlat16_7.xyz;
    u_xlati24 = (u_xlatb9) ? 3 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb48 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb48 = u_xlatb9 && u_xlatb48;
    u_xlat16_22.xyz = (bool(u_xlatb48)) ? u_xlat16_7.xyz : u_xlat16_22.xyz;
    u_xlat11.xyz = (-u_xlat19.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat67 = dot(u_xlat11.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(unity_LightAtten[4].w<u_xlat67);
#else
    u_xlatb68 = unity_LightAtten[4].w<u_xlat67;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb12 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb68 = u_xlatb68 && u_xlatb12;
    u_xlat12.x = unity_LightAtten[4].z * u_xlat67 + 1.0;
    u_xlat67 = max(u_xlat67, 9.99999997e-07);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat12.x = u_xlat12.x * 0.5;
    u_xlat16_63 = (u_xlatb68) ? 0.0 : u_xlat12.x;
    u_xlat12.xyz = vec3(u_xlat67) * u_xlat11.xyz;
    u_xlat16_7.x = dot(u_xlat4.xyz, u_xlat12.xyz);
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_26.xyz = u_xlat16_7.xxx * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.0<u_xlat16_7.x);
#else
    u_xlatb68 = 0.0<u_xlat16_7.x;
#endif
    u_xlat16_7.xyz = u_xlat16_26.xyz * unity_LightColor[4].xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_63) * u_xlat16_7.xyz;
    u_xlat16_7.xyz = min(u_xlat16_7.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_7.xyz = u_xlat16_22.xyz + u_xlat16_7.xyz;
    u_xlati24 = (u_xlatb48) ? 4 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb12 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb12 = u_xlatb48 && u_xlatb12;
    u_xlat16_22.xyz = (bool(u_xlatb12)) ? u_xlat16_7.xyz : u_xlat16_22.xyz;
    u_xlat31.xyz = (-u_xlat19.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat13 = dot(u_xlat31.xyz, u_xlat31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(unity_LightAtten[5].w<u_xlat13);
#else
    u_xlatb32 = unity_LightAtten[5].w<u_xlat13;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb51 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb32 = u_xlatb32 && u_xlatb51;
    u_xlat51 = unity_LightAtten[5].z * u_xlat13 + 1.0;
    u_xlat13 = max(u_xlat13, 9.99999997e-07);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat51 = float(1.0) / u_xlat51;
    u_xlat51 = u_xlat51 * 0.5;
    u_xlat16_7.x = (u_xlatb32) ? 0.0 : u_xlat51;
    u_xlat32.xyz = u_xlat31.xyz * vec3(u_xlat13);
    u_xlat16_26.x = dot(u_xlat4.xyz, u_xlat32.xyz);
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0);
    u_xlat16_14.xyz = u_xlat16_26.xxx * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(0.0<u_xlat16_26.x);
#else
    u_xlatb32 = 0.0<u_xlat16_26.x;
#endif
    u_xlat16_26.xyz = u_xlat16_14.xyz * unity_LightColor[5].xyz;
    u_xlat16_26.xyz = u_xlat16_7.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = min(u_xlat16_26.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_26.xyz = u_xlat16_22.xyz + u_xlat16_26.xyz;
    u_xlati24 = (u_xlatb12) ? 5 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb51 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb51 = u_xlatb12 && u_xlatb51;
    u_xlat16_22.xyz = (bool(u_xlatb51)) ? u_xlat16_26.xyz : u_xlat16_22.xyz;
    u_xlat15.xyz = (-u_xlat19.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat70 = dot(u_xlat15.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(unity_LightAtten[6].w<u_xlat70);
#else
    u_xlatb72 = unity_LightAtten[6].w<u_xlat70;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb16 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb72 = u_xlatb72 && u_xlatb16;
    u_xlat16.x = unity_LightAtten[6].z * u_xlat70 + 1.0;
    u_xlat70 = max(u_xlat70, 9.99999997e-07);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat16.x = float(1.0) / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.5;
    u_xlat16_26.x = (u_xlatb72) ? 0.0 : u_xlat16.x;
    u_xlat16.xyz = vec3(u_xlat70) * u_xlat15.xyz;
    u_xlat16_45 = dot(u_xlat4.xyz, u_xlat16.xyz);
    u_xlat16_45 = max(u_xlat16_45, 0.0);
    u_xlat16_14.xyz = vec3(u_xlat16_45) * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(0.0<u_xlat16_45);
#else
    u_xlatb72 = 0.0<u_xlat16_45;
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz * unity_LightColor[6].xyz;
    u_xlat16_14.xyz = u_xlat16_26.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = min(u_xlat16_14.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_14.xyz = u_xlat16_22.xyz + u_xlat16_14.xyz;
    u_xlati24 = (u_xlatb51) ? 6 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb16 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb16 = u_xlatb51 && u_xlatb16;
    u_xlat16_22.xyz = (bool(u_xlatb16)) ? u_xlat16_14.xyz : u_xlat16_22.xyz;
    u_xlat35.xyz = (-u_xlat19.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat17 = dot(u_xlat35.xyz, u_xlat35.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(unity_LightAtten[7].w<u_xlat17);
#else
    u_xlatb36 = unity_LightAtten[7].w<u_xlat17;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb55 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb36 = u_xlatb36 && u_xlatb55;
    u_xlat55 = unity_LightAtten[7].z * u_xlat17 + 1.0;
    u_xlat17 = max(u_xlat17, 9.99999997e-07);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat55 = float(1.0) / u_xlat55;
    u_xlat55 = u_xlat55 * 0.5;
    u_xlat16_45 = (u_xlatb36) ? 0.0 : u_xlat55;
    u_xlat36.xyz = u_xlat35.xyz * vec3(u_xlat17);
    u_xlat16_64 = dot(u_xlat4.xyz, u_xlat36.xyz);
    u_xlat16_64 = max(u_xlat16_64, 0.0);
    u_xlat16_14.xyz = vec3(u_xlat16_64) * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<u_xlat16_64);
#else
    u_xlatb36 = 0.0<u_xlat16_64;
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz * unity_LightColor[7].xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_45) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = min(u_xlat16_14.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_14.xyz = u_xlat16_22.xyz + u_xlat16_14.xyz;
    u_xlati24 = (u_xlatb16) ? 7 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb24 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb24 = u_xlatb24 && u_xlatb16;
    vs_COLOR0.xyz = (bool(u_xlatb24)) ? u_xlat16_14.xyz : u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    u_xlat55 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat19.xyz = u_xlat19.xyz * vec3(u_xlat55);
    u_xlat16_22.xyz = u_xlat21.xyz * vec3(u_xlat61) + (-u_xlat19.xyz);
    u_xlat16_64 = dot(u_xlat16_22.xyz, u_xlat16_22.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(u_xlat16_64);
    u_xlat16_22.x = dot(u_xlat4.xyz, u_xlat16_22.xyz);
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0);
    u_xlat16_22.x = log2(u_xlat16_22.x);
    u_xlat16_41 = _Shininess * 128.0;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_41;
    u_xlat16_22.x = exp2(u_xlat16_22.x);
    u_xlat16_22.x = min(u_xlat16_22.x, 1.0);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_6.x;
    u_xlat16_14.xyz = u_xlat16_22.xxx * unity_LightColor[0].xyz;
    u_xlat16_14.xyz = (bool(u_xlatb2)) ? u_xlat16_14.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_14.xyz = (bool(u_xlatb5)) ? u_xlat16_14.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_18.xyz = u_xlat1.xyz * vec3(u_xlat58) + (-u_xlat19.xyz);
    u_xlat16_22.x = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_22.x = inversesqrt(u_xlat16_22.x);
    u_xlat16_18.xyz = u_xlat16_22.xxx * u_xlat16_18.xyz;
    u_xlat16_22.x = dot(u_xlat4.xyz, u_xlat16_18.xyz);
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0);
    u_xlat16_22.x = log2(u_xlat16_22.x);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_41;
    u_xlat16_22.x = exp2(u_xlat16_22.x);
    u_xlat16_22.x = min(u_xlat16_22.x, 1.0);
    u_xlat16_3.x = u_xlat16_22.x * u_xlat16_3.x;
    u_xlat16_3.xyw = u_xlat16_3.xxx * unity_LightColor[1].xyz + u_xlat16_14.xyz;
    u_xlat16_3.xyw = (bool(u_xlatb0)) ? u_xlat16_3.xyw : u_xlat16_14.xyz;
    u_xlat16_3.xyw = (bool(u_xlatb43)) ? u_xlat16_3.xyw : u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat8.xyz * vec3(u_xlat62) + (-u_xlat19.xyz);
    u_xlat16_6.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_14.xyz = u_xlat16_6.xxx * u_xlat16_14.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_25.x;
    u_xlat16_14.xyz = u_xlat16_6.xxx * unity_LightColor[2].xyz + u_xlat16_3.xyw;
    u_xlat16_14.xyz = (bool(u_xlatb65)) ? u_xlat16_14.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb9)) ? u_xlat16_14.xyz : u_xlat16_3.xyw;
    u_xlat16_14.xyz = u_xlat28.xyz * vec3(u_xlat10) + (-u_xlat19.xyz);
    u_xlat16_6.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_14.xyz = u_xlat16_6.xxx * u_xlat16_14.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_44;
    u_xlat16_6.xyz = u_xlat16_6.xxx * unity_LightColor[3].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb29)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb48)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_6.xyz = u_xlat11.xyz * vec3(u_xlat67) + (-u_xlat19.xyz);
    u_xlat16_64 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat16_64);
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_6.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_63;
    u_xlat16_6.xyz = u_xlat16_6.xxx * unity_LightColor[4].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb68)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb12)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_6.xyz = u_xlat31.xyz * vec3(u_xlat13) + (-u_xlat19.xyz);
    u_xlat16_63 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_6.xyz = vec3(u_xlat16_63) * u_xlat16_6.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_6.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_7.x;
    u_xlat16_6.xyz = u_xlat16_6.xxx * unity_LightColor[5].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb32)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb51)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_6.xyz = u_xlat15.xyz * vec3(u_xlat70) + (-u_xlat19.xyz);
    u_xlat16_14.xyz = u_xlat35.xyz * vec3(u_xlat17) + (-u_xlat19.xyz);
    u_xlat16_63 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_6.xyz = vec3(u_xlat16_63) * u_xlat16_6.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_6.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_26.x;
    u_xlat16_6.xyz = u_xlat16_6.xxx * unity_LightColor[6].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb72)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb16)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_6.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_14.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_6.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_41 = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_41 = exp2(u_xlat16_41);
    u_xlat16_41 = min(u_xlat16_41, 1.0);
    u_xlat16_41 = u_xlat16_41 * u_xlat16_45;
    u_xlat16_6.xyz = vec3(u_xlat16_41) * unity_LightColor[7].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb36)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyz = (bool(u_xlatb24)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    vs_COLOR1.xyz = u_xlat16_3.xyz * _SpecColor.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR1.xyz = min(max(vs_COLOR1.xyz, 0.0), 1.0);
#else
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Illum;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_COLOR1;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
bool u_xlatb14;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_20;
bool u_xlatb25;
float u_xlat33;
int u_xlati34;
float u_xlat35;
bool u_xlatb35;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat16_7 = _Shininess * 128.0;
    u_xlat16_18.x = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat16_18.z = float(0.0);
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat35 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat3.x = unity_LightAtten[u_xlati_loop_1].z * u_xlat35 + 1.0;
        u_xlat3.x = float(1.0) / u_xlat3.x;
        u_xlatb14 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb25 = unity_LightAtten[u_xlati_loop_1].w<u_xlat35;
        u_xlatb14 = u_xlatb25 && u_xlatb14;
        u_xlat16_41 = (u_xlatb14) ? 0.0 : u_xlat3.x;
        u_xlat35 = max(u_xlat35, 9.99999997e-07);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat2.xyz = vec3(u_xlat35) * u_xlat2.xyz;
        u_xlat35 = dot(u_xlat2.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat35 = max(u_xlat35, 0.0);
        u_xlat16_9.x = u_xlat35 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16_9.x = u_xlat16_9.x * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
        u_xlat16_41 = u_xlat16_41 * u_xlat16_9.x;
        u_xlat16_41 = u_xlat16_41 * 0.5;
        u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
        u_xlat16_20.xyz = u_xlat16_9.xxx * _Color.xyz;
        u_xlat16_20.xyz = u_xlat16_20.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb35 = 0.0<u_xlat16_9.x;
        if(u_xlatb35){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + u_xlat2.xyz;
            u_xlat16_9.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
            u_xlat16_10.xyz = u_xlat16_9.xxx * u_xlat16_10.xyz;
            u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
            u_xlat16_9.x = log2(u_xlat16_9.x);
            u_xlat16_9.x = u_xlat16_7 * u_xlat16_9.x;
            u_xlat16_9.x = exp2(u_xlat16_9.x);
            u_xlat16_9.x = min(u_xlat16_9.x, 1.0);
            u_xlat16_9.x = u_xlat16_41 * u_xlat16_9.x;
            u_xlat16_8.xyz = u_xlat16_9.xxx * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        }
        u_xlat16_9.xyz = vec3(u_xlat16_41) * u_xlat16_20.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat16_18.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Illum;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0.x = texture2D(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat10_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
bool u_xlatb14;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_20;
bool u_xlatb25;
float u_xlat33;
int u_xlati34;
float u_xlat35;
bool u_xlatb35;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat16_7 = _Shininess * 128.0;
    u_xlat16_18.x = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat16_18.z = float(0.0);
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat35 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat3.x = unity_LightAtten[u_xlati_loop_1].z * u_xlat35 + 1.0;
        u_xlat3.x = float(1.0) / u_xlat3.x;
        u_xlatb14 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb25 = unity_LightAtten[u_xlati_loop_1].w<u_xlat35;
        u_xlatb14 = u_xlatb25 && u_xlatb14;
        u_xlat16_41 = (u_xlatb14) ? 0.0 : u_xlat3.x;
        u_xlat35 = max(u_xlat35, 9.99999997e-07);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat2.xyz = vec3(u_xlat35) * u_xlat2.xyz;
        u_xlat35 = dot(u_xlat2.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat35 = max(u_xlat35, 0.0);
        u_xlat16_9.x = u_xlat35 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16_9.x = u_xlat16_9.x * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
        u_xlat16_41 = u_xlat16_41 * u_xlat16_9.x;
        u_xlat16_41 = u_xlat16_41 * 0.5;
        u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
        u_xlat16_20.xyz = u_xlat16_9.xxx * _Color.xyz;
        u_xlat16_20.xyz = u_xlat16_20.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb35 = 0.0<u_xlat16_9.x;
        if(u_xlatb35){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + u_xlat2.xyz;
            u_xlat16_9.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
            u_xlat16_10.xyz = u_xlat16_9.xxx * u_xlat16_10.xyz;
            u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
            u_xlat16_9.x = log2(u_xlat16_9.x);
            u_xlat16_9.x = u_xlat16_7 * u_xlat16_9.x;
            u_xlat16_9.x = exp2(u_xlat16_9.x);
            u_xlat16_9.x = min(u_xlat16_9.x, 1.0);
            u_xlat16_9.x = u_xlat16_41 * u_xlat16_9.x;
            u_xlat16_8.xyz = u_xlat16_9.xxx * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        }
        u_xlat16_9.xyz = vec3(u_xlat16_41) * u_xlat16_20.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat16_18.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Illum;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0.x = texture2D(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat10_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
bool u_xlatb14;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_20;
bool u_xlatb25;
float u_xlat33;
int u_xlati34;
float u_xlat35;
bool u_xlatb35;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat16_7 = _Shininess * 128.0;
    u_xlat16_18.x = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat16_18.z = float(0.0);
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat2.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat35 = dot(u_xlat2.xyz, u_xlat2.xyz);
        u_xlat3.x = unity_LightAtten[u_xlati_loop_1].z * u_xlat35 + 1.0;
        u_xlat3.x = float(1.0) / u_xlat3.x;
        u_xlatb14 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb25 = unity_LightAtten[u_xlati_loop_1].w<u_xlat35;
        u_xlatb14 = u_xlatb25 && u_xlatb14;
        u_xlat16_41 = (u_xlatb14) ? 0.0 : u_xlat3.x;
        u_xlat35 = max(u_xlat35, 9.99999997e-07);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat2.xyz = vec3(u_xlat35) * u_xlat2.xyz;
        u_xlat35 = dot(u_xlat2.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat35 = max(u_xlat35, 0.0);
        u_xlat16_9.x = u_xlat35 + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16_9.x = u_xlat16_9.x * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
        u_xlat16_41 = u_xlat16_41 * u_xlat16_9.x;
        u_xlat16_41 = u_xlat16_41 * 0.5;
        u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat2.xyz);
        u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
        u_xlat16_20.xyz = u_xlat16_9.xxx * _Color.xyz;
        u_xlat16_20.xyz = u_xlat16_20.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb35 = 0.0<u_xlat16_9.x;
        if(u_xlatb35){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat33) + u_xlat2.xyz;
            u_xlat16_9.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
            u_xlat16_10.xyz = u_xlat16_9.xxx * u_xlat16_10.xyz;
            u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
            u_xlat16_9.x = log2(u_xlat16_9.x);
            u_xlat16_9.x = u_xlat16_7 * u_xlat16_9.x;
            u_xlat16_9.x = exp2(u_xlat16_9.x);
            u_xlat16_9.x = min(u_xlat16_9.x, 1.0);
            u_xlat16_9.x = u_xlat16_41 * u_xlat16_9.x;
            u_xlat16_8.xyz = u_xlat16_9.xxx * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        }
        u_xlat16_9.xyz = vec3(u_xlat16_41) * u_xlat16_20.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat16_18.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Illum;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0.x = texture2D(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat10_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_COLOR1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
bool u_xlatb15;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_29;
float u_xlat33;
int u_xlati33;
bool u_xlatb33;
float u_xlat34;
bool u_xlatb34;
float u_xlat35;
bool u_xlatb35;
float u_xlat36;
bool u_xlatb36;
mediump float u_xlat16_42;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat16_7 = _Shininess * 128.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb33 = 0<unity_VertexLightParams.x;
#endif
    if(u_xlatb33){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
        u_xlat33 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat34 = unity_LightAtten[0].z * u_xlat33 + 1.0;
        u_xlat34 = float(1.0) / u_xlat34;
#ifdef UNITY_ADRENO_ES3
        u_xlatb35 = !!(unity_LightPosition[0].w!=0.0);
#else
        u_xlatb35 = unity_LightPosition[0].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(unity_LightAtten[0].w<u_xlat33);
#else
        u_xlatb36 = unity_LightAtten[0].w<u_xlat33;
#endif
        u_xlatb35 = u_xlatb35 && u_xlatb36;
        u_xlat16_18.x = (u_xlatb35) ? 0.0 : u_xlat34;
        u_xlat33 = max(u_xlat33, 9.99999997e-07);
        u_xlat33 = inversesqrt(u_xlat33);
        u_xlat4.xyz = vec3(u_xlat33) * u_xlat3.xyz;
        u_xlat34 = dot(u_xlat4.xyz, unity_SpotDirection[0].xyz);
        u_xlat34 = max(u_xlat34, 0.0);
        u_xlat16_29 = u_xlat34 + (-unity_LightAtten[0].x);
        u_xlat16_29 = u_xlat16_29 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_29 = min(max(u_xlat16_29, 0.0), 1.0);
#else
        u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
#endif
        u_xlat16_18.x = u_xlat16_29 * u_xlat16_18.x;
        u_xlat16_18.x = u_xlat16_18.x * 0.5;
        u_xlat16_29 = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_29 = max(u_xlat16_29, 0.0);
        u_xlat16_8.xyz = vec3(u_xlat16_29) * _Color.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xyz * unity_LightColor[0].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb34 = !!(0.0<u_xlat16_29);
#else
        u_xlatb34 = 0.0<u_xlat16_29;
#endif
        u_xlat16_9.xyz = u_xlat3.xyz * vec3(u_xlat33) + (-u_xlat2.xyz);
        u_xlat16_29 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
        u_xlat16_29 = inversesqrt(u_xlat16_29);
        u_xlat16_9.xyz = vec3(u_xlat16_29) * u_xlat16_9.xyz;
        u_xlat16_29 = dot(u_xlat1.xyz, u_xlat16_9.xyz);
        u_xlat16_29 = max(u_xlat16_29, 0.0);
        u_xlat16_29 = log2(u_xlat16_29);
        u_xlat16_29 = u_xlat16_29 * u_xlat16_7;
        u_xlat16_29 = exp2(u_xlat16_29);
        u_xlat16_29 = min(u_xlat16_29, 1.0);
        u_xlat16_29 = u_xlat16_29 * u_xlat16_18.x;
        u_xlat16_9.xyz = vec3(u_xlat16_29) * unity_LightColor[0].xyz;
        u_xlat16_9.xyz = (bool(u_xlatb34)) ? u_xlat16_9.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat16_18.xyz = u_xlat16_18.xxx * u_xlat16_8.xyz;
        u_xlat16_18.xyz = min(u_xlat16_18.xyz, vec3(1.0, 1.0, 1.0));
        u_xlati33 = 1;
    } else {
        u_xlat16_18.x = float(0.0);
        u_xlat16_18.y = float(0.0);
        u_xlat16_18.z = float(0.0);
        u_xlat16_9.x = float(0.0);
        u_xlat16_9.y = float(0.0);
        u_xlat16_9.z = float(0.0);
        u_xlati33 = 0;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(u_xlati33<unity_VertexLightParams.x);
#else
    u_xlatb34 = u_xlati33<unity_VertexLightParams.x;
#endif
    if(u_xlatb34){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
        u_xlat35 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat36 = unity_LightAtten[1].z * u_xlat35 + 1.0;
        u_xlat36 = float(1.0) / u_xlat36;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(unity_LightPosition[1].w!=0.0);
#else
        u_xlatb4 = unity_LightPosition[1].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightAtten[1].w<u_xlat35);
#else
        u_xlatb15 = unity_LightAtten[1].w<u_xlat35;
#endif
        u_xlatb4 = u_xlatb15 && u_xlatb4;
        u_xlat16_8.x = (u_xlatb4) ? 0.0 : u_xlat36;
        u_xlat35 = max(u_xlat35, 9.99999997e-07);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat4.xyz = vec3(u_xlat35) * u_xlat3.xyz;
        u_xlat36 = dot(u_xlat4.xyz, unity_SpotDirection[1].xyz);
        u_xlat36 = max(u_xlat36, 0.0);
        u_xlat16_19.x = u_xlat36 + (-unity_LightAtten[1].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb36 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat35) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[1].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb36)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati33 = 2;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(u_xlati33<unity_VertexLightParams.x);
#else
    u_xlatb35 = u_xlati33<unity_VertexLightParams.x;
#endif
    u_xlatb34 = u_xlatb34 && u_xlatb35;
    if(u_xlatb34){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
        u_xlat35 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat36 = unity_LightAtten[2].z * u_xlat35 + 1.0;
        u_xlat36 = float(1.0) / u_xlat36;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(unity_LightPosition[2].w!=0.0);
#else
        u_xlatb4 = unity_LightPosition[2].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightAtten[2].w<u_xlat35);
#else
        u_xlatb15 = unity_LightAtten[2].w<u_xlat35;
#endif
        u_xlatb4 = u_xlatb15 && u_xlatb4;
        u_xlat16_8.x = (u_xlatb4) ? 0.0 : u_xlat36;
        u_xlat35 = max(u_xlat35, 9.99999997e-07);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat4.xyz = vec3(u_xlat35) * u_xlat3.xyz;
        u_xlat36 = dot(u_xlat4.xyz, unity_SpotDirection[2].xyz);
        u_xlat36 = max(u_xlat36, 0.0);
        u_xlat16_19.x = u_xlat36 + (-unity_LightAtten[2].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[2].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb36 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat35) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[2].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb36)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati33 = 3;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(u_xlati33<unity_VertexLightParams.x);
#else
    u_xlatb35 = u_xlati33<unity_VertexLightParams.x;
#endif
    u_xlatb34 = u_xlatb34 && u_xlatb35;
    if(u_xlatb34){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
        u_xlat35 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat36 = unity_LightAtten[3].z * u_xlat35 + 1.0;
        u_xlat36 = float(1.0) / u_xlat36;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(unity_LightPosition[3].w!=0.0);
#else
        u_xlatb4 = unity_LightPosition[3].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightAtten[3].w<u_xlat35);
#else
        u_xlatb15 = unity_LightAtten[3].w<u_xlat35;
#endif
        u_xlatb4 = u_xlatb15 && u_xlatb4;
        u_xlat16_8.x = (u_xlatb4) ? 0.0 : u_xlat36;
        u_xlat35 = max(u_xlat35, 9.99999997e-07);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat4.xyz = vec3(u_xlat35) * u_xlat3.xyz;
        u_xlat36 = dot(u_xlat4.xyz, unity_SpotDirection[3].xyz);
        u_xlat36 = max(u_xlat36, 0.0);
        u_xlat16_19.x = u_xlat36 + (-unity_LightAtten[3].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb36 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat35) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[3].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb36)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati33 = 4;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(u_xlati33<unity_VertexLightParams.x);
#else
    u_xlatb35 = u_xlati33<unity_VertexLightParams.x;
#endif
    u_xlatb34 = u_xlatb34 && u_xlatb35;
    if(u_xlatb34){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
        u_xlat35 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat36 = unity_LightAtten[4].z * u_xlat35 + 1.0;
        u_xlat36 = float(1.0) / u_xlat36;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(unity_LightPosition[4].w!=0.0);
#else
        u_xlatb4 = unity_LightPosition[4].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightAtten[4].w<u_xlat35);
#else
        u_xlatb15 = unity_LightAtten[4].w<u_xlat35;
#endif
        u_xlatb4 = u_xlatb15 && u_xlatb4;
        u_xlat16_8.x = (u_xlatb4) ? 0.0 : u_xlat36;
        u_xlat35 = max(u_xlat35, 9.99999997e-07);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat4.xyz = vec3(u_xlat35) * u_xlat3.xyz;
        u_xlat36 = dot(u_xlat4.xyz, unity_SpotDirection[4].xyz);
        u_xlat36 = max(u_xlat36, 0.0);
        u_xlat16_19.x = u_xlat36 + (-unity_LightAtten[4].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb36 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat35) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[4].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb36)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati33 = 5;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(u_xlati33<unity_VertexLightParams.x);
#else
    u_xlatb35 = u_xlati33<unity_VertexLightParams.x;
#endif
    u_xlatb34 = u_xlatb34 && u_xlatb35;
    if(u_xlatb34){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
        u_xlat35 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat36 = unity_LightAtten[5].z * u_xlat35 + 1.0;
        u_xlat36 = float(1.0) / u_xlat36;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(unity_LightPosition[5].w!=0.0);
#else
        u_xlatb4 = unity_LightPosition[5].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightAtten[5].w<u_xlat35);
#else
        u_xlatb15 = unity_LightAtten[5].w<u_xlat35;
#endif
        u_xlatb4 = u_xlatb15 && u_xlatb4;
        u_xlat16_8.x = (u_xlatb4) ? 0.0 : u_xlat36;
        u_xlat35 = max(u_xlat35, 9.99999997e-07);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat4.xyz = vec3(u_xlat35) * u_xlat3.xyz;
        u_xlat36 = dot(u_xlat4.xyz, unity_SpotDirection[5].xyz);
        u_xlat36 = max(u_xlat36, 0.0);
        u_xlat16_19.x = u_xlat36 + (-unity_LightAtten[5].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb36 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat35) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[5].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb36)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati33 = 6;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(u_xlati33<unity_VertexLightParams.x);
#else
    u_xlatb35 = u_xlati33<unity_VertexLightParams.x;
#endif
    u_xlatb34 = u_xlatb34 && u_xlatb35;
    if(u_xlatb34){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
        u_xlat35 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat36 = unity_LightAtten[6].z * u_xlat35 + 1.0;
        u_xlat36 = float(1.0) / u_xlat36;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(unity_LightPosition[6].w!=0.0);
#else
        u_xlatb4 = unity_LightPosition[6].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightAtten[6].w<u_xlat35);
#else
        u_xlatb15 = unity_LightAtten[6].w<u_xlat35;
#endif
        u_xlatb4 = u_xlatb15 && u_xlatb4;
        u_xlat16_8.x = (u_xlatb4) ? 0.0 : u_xlat36;
        u_xlat35 = max(u_xlat35, 9.99999997e-07);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat4.xyz = vec3(u_xlat35) * u_xlat3.xyz;
        u_xlat36 = dot(u_xlat4.xyz, unity_SpotDirection[6].xyz);
        u_xlat36 = max(u_xlat36, 0.0);
        u_xlat16_19.x = u_xlat36 + (-unity_LightAtten[6].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb36 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat35) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[6].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb36)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati33 = 7;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(u_xlati33<unity_VertexLightParams.x);
#else
    u_xlatb33 = u_xlati33<unity_VertexLightParams.x;
#endif
    u_xlatb33 = u_xlatb33 && u_xlatb34;
    if(u_xlatb33){
        u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
        u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat34 = unity_LightAtten[7].z * u_xlat33 + 1.0;
        u_xlat34 = float(1.0) / u_xlat34;
#ifdef UNITY_ADRENO_ES3
        u_xlatb35 = !!(unity_LightPosition[7].w!=0.0);
#else
        u_xlatb35 = unity_LightPosition[7].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(unity_LightAtten[7].w<u_xlat33);
#else
        u_xlatb3 = unity_LightAtten[7].w<u_xlat33;
#endif
        u_xlatb35 = u_xlatb35 && u_xlatb3;
        u_xlat16_8.x = (u_xlatb35) ? 0.0 : u_xlat34;
        u_xlat33 = max(u_xlat33, 9.99999997e-07);
        u_xlat33 = inversesqrt(u_xlat33);
        u_xlat3.xyz = vec3(u_xlat33) * u_xlat0.xyz;
        u_xlat34 = dot(u_xlat3.xyz, unity_SpotDirection[7].xyz);
        u_xlat34 = max(u_xlat34, 0.0);
        u_xlat16_19.x = u_xlat34 + (-unity_LightAtten[7].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat3.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb34 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb34 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat0.xyz * vec3(u_xlat33) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_7 = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_7 = exp2(u_xlat16_7);
        u_xlat16_7 = min(u_xlat16_7, 1.0);
        u_xlat16_7 = u_xlat16_7 * u_xlat16_8.x;
        u_xlat16_19.xyz = vec3(u_xlat16_7) * unity_LightColor[7].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb34)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_9.xyz * _SpecColor.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR1.xyz = min(max(vs_COLOR1.xyz, 0.0), 1.0);
#else
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.xyz = u_xlat16_18.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Illum;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_COLOR1;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_COLOR1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
bool u_xlatb15;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_29;
float u_xlat33;
int u_xlati33;
bool u_xlatb33;
float u_xlat34;
bool u_xlatb34;
float u_xlat35;
bool u_xlatb35;
float u_xlat36;
bool u_xlatb36;
mediump float u_xlat16_42;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat16_7 = _Shininess * 128.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb33 = 0<unity_VertexLightParams.x;
#endif
    if(u_xlatb33){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
        u_xlat33 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat34 = unity_LightAtten[0].z * u_xlat33 + 1.0;
        u_xlat34 = float(1.0) / u_xlat34;
#ifdef UNITY_ADRENO_ES3
        u_xlatb35 = !!(unity_LightPosition[0].w!=0.0);
#else
        u_xlatb35 = unity_LightPosition[0].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(unity_LightAtten[0].w<u_xlat33);
#else
        u_xlatb36 = unity_LightAtten[0].w<u_xlat33;
#endif
        u_xlatb35 = u_xlatb35 && u_xlatb36;
        u_xlat16_18.x = (u_xlatb35) ? 0.0 : u_xlat34;
        u_xlat33 = max(u_xlat33, 9.99999997e-07);
        u_xlat33 = inversesqrt(u_xlat33);
        u_xlat4.xyz = vec3(u_xlat33) * u_xlat3.xyz;
        u_xlat34 = dot(u_xlat4.xyz, unity_SpotDirection[0].xyz);
        u_xlat34 = max(u_xlat34, 0.0);
        u_xlat16_29 = u_xlat34 + (-unity_LightAtten[0].x);
        u_xlat16_29 = u_xlat16_29 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_29 = min(max(u_xlat16_29, 0.0), 1.0);
#else
        u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
#endif
        u_xlat16_18.x = u_xlat16_29 * u_xlat16_18.x;
        u_xlat16_18.x = u_xlat16_18.x * 0.5;
        u_xlat16_29 = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_29 = max(u_xlat16_29, 0.0);
        u_xlat16_8.xyz = vec3(u_xlat16_29) * _Color.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xyz * unity_LightColor[0].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb34 = !!(0.0<u_xlat16_29);
#else
        u_xlatb34 = 0.0<u_xlat16_29;
#endif
        u_xlat16_9.xyz = u_xlat3.xyz * vec3(u_xlat33) + (-u_xlat2.xyz);
        u_xlat16_29 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
        u_xlat16_29 = inversesqrt(u_xlat16_29);
        u_xlat16_9.xyz = vec3(u_xlat16_29) * u_xlat16_9.xyz;
        u_xlat16_29 = dot(u_xlat1.xyz, u_xlat16_9.xyz);
        u_xlat16_29 = max(u_xlat16_29, 0.0);
        u_xlat16_29 = log2(u_xlat16_29);
        u_xlat16_29 = u_xlat16_29 * u_xlat16_7;
        u_xlat16_29 = exp2(u_xlat16_29);
        u_xlat16_29 = min(u_xlat16_29, 1.0);
        u_xlat16_29 = u_xlat16_29 * u_xlat16_18.x;
        u_xlat16_9.xyz = vec3(u_xlat16_29) * unity_LightColor[0].xyz;
        u_xlat16_9.xyz = (bool(u_xlatb34)) ? u_xlat16_9.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat16_18.xyz = u_xlat16_18.xxx * u_xlat16_8.xyz;
        u_xlat16_18.xyz = min(u_xlat16_18.xyz, vec3(1.0, 1.0, 1.0));
        u_xlati33 = 1;
    } else {
        u_xlat16_18.x = float(0.0);
        u_xlat16_18.y = float(0.0);
        u_xlat16_18.z = float(0.0);
        u_xlat16_9.x = float(0.0);
        u_xlat16_9.y = float(0.0);
        u_xlat16_9.z = float(0.0);
        u_xlati33 = 0;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(u_xlati33<unity_VertexLightParams.x);
#else
    u_xlatb34 = u_xlati33<unity_VertexLightParams.x;
#endif
    if(u_xlatb34){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
        u_xlat35 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat36 = unity_LightAtten[1].z * u_xlat35 + 1.0;
        u_xlat36 = float(1.0) / u_xlat36;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(unity_LightPosition[1].w!=0.0);
#else
        u_xlatb4 = unity_LightPosition[1].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightAtten[1].w<u_xlat35);
#else
        u_xlatb15 = unity_LightAtten[1].w<u_xlat35;
#endif
        u_xlatb4 = u_xlatb15 && u_xlatb4;
        u_xlat16_8.x = (u_xlatb4) ? 0.0 : u_xlat36;
        u_xlat35 = max(u_xlat35, 9.99999997e-07);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat4.xyz = vec3(u_xlat35) * u_xlat3.xyz;
        u_xlat36 = dot(u_xlat4.xyz, unity_SpotDirection[1].xyz);
        u_xlat36 = max(u_xlat36, 0.0);
        u_xlat16_19.x = u_xlat36 + (-unity_LightAtten[1].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb36 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat35) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[1].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb36)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati33 = 2;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(u_xlati33<unity_VertexLightParams.x);
#else
    u_xlatb35 = u_xlati33<unity_VertexLightParams.x;
#endif
    u_xlatb34 = u_xlatb34 && u_xlatb35;
    if(u_xlatb34){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
        u_xlat35 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat36 = unity_LightAtten[2].z * u_xlat35 + 1.0;
        u_xlat36 = float(1.0) / u_xlat36;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(unity_LightPosition[2].w!=0.0);
#else
        u_xlatb4 = unity_LightPosition[2].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightAtten[2].w<u_xlat35);
#else
        u_xlatb15 = unity_LightAtten[2].w<u_xlat35;
#endif
        u_xlatb4 = u_xlatb15 && u_xlatb4;
        u_xlat16_8.x = (u_xlatb4) ? 0.0 : u_xlat36;
        u_xlat35 = max(u_xlat35, 9.99999997e-07);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat4.xyz = vec3(u_xlat35) * u_xlat3.xyz;
        u_xlat36 = dot(u_xlat4.xyz, unity_SpotDirection[2].xyz);
        u_xlat36 = max(u_xlat36, 0.0);
        u_xlat16_19.x = u_xlat36 + (-unity_LightAtten[2].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[2].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb36 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat35) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[2].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb36)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati33 = 3;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(u_xlati33<unity_VertexLightParams.x);
#else
    u_xlatb35 = u_xlati33<unity_VertexLightParams.x;
#endif
    u_xlatb34 = u_xlatb34 && u_xlatb35;
    if(u_xlatb34){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
        u_xlat35 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat36 = unity_LightAtten[3].z * u_xlat35 + 1.0;
        u_xlat36 = float(1.0) / u_xlat36;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(unity_LightPosition[3].w!=0.0);
#else
        u_xlatb4 = unity_LightPosition[3].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightAtten[3].w<u_xlat35);
#else
        u_xlatb15 = unity_LightAtten[3].w<u_xlat35;
#endif
        u_xlatb4 = u_xlatb15 && u_xlatb4;
        u_xlat16_8.x = (u_xlatb4) ? 0.0 : u_xlat36;
        u_xlat35 = max(u_xlat35, 9.99999997e-07);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat4.xyz = vec3(u_xlat35) * u_xlat3.xyz;
        u_xlat36 = dot(u_xlat4.xyz, unity_SpotDirection[3].xyz);
        u_xlat36 = max(u_xlat36, 0.0);
        u_xlat16_19.x = u_xlat36 + (-unity_LightAtten[3].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb36 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat35) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[3].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb36)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati33 = 4;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(u_xlati33<unity_VertexLightParams.x);
#else
    u_xlatb35 = u_xlati33<unity_VertexLightParams.x;
#endif
    u_xlatb34 = u_xlatb34 && u_xlatb35;
    if(u_xlatb34){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
        u_xlat35 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat36 = unity_LightAtten[4].z * u_xlat35 + 1.0;
        u_xlat36 = float(1.0) / u_xlat36;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(unity_LightPosition[4].w!=0.0);
#else
        u_xlatb4 = unity_LightPosition[4].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightAtten[4].w<u_xlat35);
#else
        u_xlatb15 = unity_LightAtten[4].w<u_xlat35;
#endif
        u_xlatb4 = u_xlatb15 && u_xlatb4;
        u_xlat16_8.x = (u_xlatb4) ? 0.0 : u_xlat36;
        u_xlat35 = max(u_xlat35, 9.99999997e-07);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat4.xyz = vec3(u_xlat35) * u_xlat3.xyz;
        u_xlat36 = dot(u_xlat4.xyz, unity_SpotDirection[4].xyz);
        u_xlat36 = max(u_xlat36, 0.0);
        u_xlat16_19.x = u_xlat36 + (-unity_LightAtten[4].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb36 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat35) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[4].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb36)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati33 = 5;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(u_xlati33<unity_VertexLightParams.x);
#else
    u_xlatb35 = u_xlati33<unity_VertexLightParams.x;
#endif
    u_xlatb34 = u_xlatb34 && u_xlatb35;
    if(u_xlatb34){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
        u_xlat35 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat36 = unity_LightAtten[5].z * u_xlat35 + 1.0;
        u_xlat36 = float(1.0) / u_xlat36;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(unity_LightPosition[5].w!=0.0);
#else
        u_xlatb4 = unity_LightPosition[5].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightAtten[5].w<u_xlat35);
#else
        u_xlatb15 = unity_LightAtten[5].w<u_xlat35;
#endif
        u_xlatb4 = u_xlatb15 && u_xlatb4;
        u_xlat16_8.x = (u_xlatb4) ? 0.0 : u_xlat36;
        u_xlat35 = max(u_xlat35, 9.99999997e-07);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat4.xyz = vec3(u_xlat35) * u_xlat3.xyz;
        u_xlat36 = dot(u_xlat4.xyz, unity_SpotDirection[5].xyz);
        u_xlat36 = max(u_xlat36, 0.0);
        u_xlat16_19.x = u_xlat36 + (-unity_LightAtten[5].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb36 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat35) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[5].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb36)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati33 = 6;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(u_xlati33<unity_VertexLightParams.x);
#else
    u_xlatb35 = u_xlati33<unity_VertexLightParams.x;
#endif
    u_xlatb34 = u_xlatb34 && u_xlatb35;
    if(u_xlatb34){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
        u_xlat35 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat36 = unity_LightAtten[6].z * u_xlat35 + 1.0;
        u_xlat36 = float(1.0) / u_xlat36;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(unity_LightPosition[6].w!=0.0);
#else
        u_xlatb4 = unity_LightPosition[6].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightAtten[6].w<u_xlat35);
#else
        u_xlatb15 = unity_LightAtten[6].w<u_xlat35;
#endif
        u_xlatb4 = u_xlatb15 && u_xlatb4;
        u_xlat16_8.x = (u_xlatb4) ? 0.0 : u_xlat36;
        u_xlat35 = max(u_xlat35, 9.99999997e-07);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat4.xyz = vec3(u_xlat35) * u_xlat3.xyz;
        u_xlat36 = dot(u_xlat4.xyz, unity_SpotDirection[6].xyz);
        u_xlat36 = max(u_xlat36, 0.0);
        u_xlat16_19.x = u_xlat36 + (-unity_LightAtten[6].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb36 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat35) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[6].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb36)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati33 = 7;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(u_xlati33<unity_VertexLightParams.x);
#else
    u_xlatb33 = u_xlati33<unity_VertexLightParams.x;
#endif
    u_xlatb33 = u_xlatb33 && u_xlatb34;
    if(u_xlatb33){
        u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
        u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat34 = unity_LightAtten[7].z * u_xlat33 + 1.0;
        u_xlat34 = float(1.0) / u_xlat34;
#ifdef UNITY_ADRENO_ES3
        u_xlatb35 = !!(unity_LightPosition[7].w!=0.0);
#else
        u_xlatb35 = unity_LightPosition[7].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(unity_LightAtten[7].w<u_xlat33);
#else
        u_xlatb3 = unity_LightAtten[7].w<u_xlat33;
#endif
        u_xlatb35 = u_xlatb35 && u_xlatb3;
        u_xlat16_8.x = (u_xlatb35) ? 0.0 : u_xlat34;
        u_xlat33 = max(u_xlat33, 9.99999997e-07);
        u_xlat33 = inversesqrt(u_xlat33);
        u_xlat3.xyz = vec3(u_xlat33) * u_xlat0.xyz;
        u_xlat34 = dot(u_xlat3.xyz, unity_SpotDirection[7].xyz);
        u_xlat34 = max(u_xlat34, 0.0);
        u_xlat16_19.x = u_xlat34 + (-unity_LightAtten[7].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat3.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb34 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb34 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat0.xyz * vec3(u_xlat33) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_7 = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_7 = exp2(u_xlat16_7);
        u_xlat16_7 = min(u_xlat16_7, 1.0);
        u_xlat16_7 = u_xlat16_7 * u_xlat16_8.x;
        u_xlat16_19.xyz = vec3(u_xlat16_7) * unity_LightColor[7].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb34)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_9.xyz * _SpecColor.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR1.xyz = min(max(vs_COLOR1.xyz, 0.0), 1.0);
#else
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.xyz = u_xlat16_18.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Illum;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_COLOR1;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_COLOR1;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
vec3 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
bool u_xlatb15;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_29;
float u_xlat33;
int u_xlati33;
bool u_xlatb33;
float u_xlat34;
bool u_xlatb34;
float u_xlat35;
bool u_xlatb35;
float u_xlat36;
bool u_xlatb36;
mediump float u_xlat16_42;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat2.xyz = vec3(u_xlat33) * u_xlat0.xyz;
    u_xlat16_7 = _Shininess * 128.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb33 = 0<unity_VertexLightParams.x;
#endif
    if(u_xlatb33){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
        u_xlat33 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat34 = unity_LightAtten[0].z * u_xlat33 + 1.0;
        u_xlat34 = float(1.0) / u_xlat34;
#ifdef UNITY_ADRENO_ES3
        u_xlatb35 = !!(unity_LightPosition[0].w!=0.0);
#else
        u_xlatb35 = unity_LightPosition[0].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(unity_LightAtten[0].w<u_xlat33);
#else
        u_xlatb36 = unity_LightAtten[0].w<u_xlat33;
#endif
        u_xlatb35 = u_xlatb35 && u_xlatb36;
        u_xlat16_18.x = (u_xlatb35) ? 0.0 : u_xlat34;
        u_xlat33 = max(u_xlat33, 9.99999997e-07);
        u_xlat33 = inversesqrt(u_xlat33);
        u_xlat4.xyz = vec3(u_xlat33) * u_xlat3.xyz;
        u_xlat34 = dot(u_xlat4.xyz, unity_SpotDirection[0].xyz);
        u_xlat34 = max(u_xlat34, 0.0);
        u_xlat16_29 = u_xlat34 + (-unity_LightAtten[0].x);
        u_xlat16_29 = u_xlat16_29 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_29 = min(max(u_xlat16_29, 0.0), 1.0);
#else
        u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
#endif
        u_xlat16_18.x = u_xlat16_29 * u_xlat16_18.x;
        u_xlat16_18.x = u_xlat16_18.x * 0.5;
        u_xlat16_29 = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_29 = max(u_xlat16_29, 0.0);
        u_xlat16_8.xyz = vec3(u_xlat16_29) * _Color.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xyz * unity_LightColor[0].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb34 = !!(0.0<u_xlat16_29);
#else
        u_xlatb34 = 0.0<u_xlat16_29;
#endif
        u_xlat16_9.xyz = u_xlat3.xyz * vec3(u_xlat33) + (-u_xlat2.xyz);
        u_xlat16_29 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
        u_xlat16_29 = inversesqrt(u_xlat16_29);
        u_xlat16_9.xyz = vec3(u_xlat16_29) * u_xlat16_9.xyz;
        u_xlat16_29 = dot(u_xlat1.xyz, u_xlat16_9.xyz);
        u_xlat16_29 = max(u_xlat16_29, 0.0);
        u_xlat16_29 = log2(u_xlat16_29);
        u_xlat16_29 = u_xlat16_29 * u_xlat16_7;
        u_xlat16_29 = exp2(u_xlat16_29);
        u_xlat16_29 = min(u_xlat16_29, 1.0);
        u_xlat16_29 = u_xlat16_29 * u_xlat16_18.x;
        u_xlat16_9.xyz = vec3(u_xlat16_29) * unity_LightColor[0].xyz;
        u_xlat16_9.xyz = (bool(u_xlatb34)) ? u_xlat16_9.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat16_18.xyz = u_xlat16_18.xxx * u_xlat16_8.xyz;
        u_xlat16_18.xyz = min(u_xlat16_18.xyz, vec3(1.0, 1.0, 1.0));
        u_xlati33 = 1;
    } else {
        u_xlat16_18.x = float(0.0);
        u_xlat16_18.y = float(0.0);
        u_xlat16_18.z = float(0.0);
        u_xlat16_9.x = float(0.0);
        u_xlat16_9.y = float(0.0);
        u_xlat16_9.z = float(0.0);
        u_xlati33 = 0;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(u_xlati33<unity_VertexLightParams.x);
#else
    u_xlatb34 = u_xlati33<unity_VertexLightParams.x;
#endif
    if(u_xlatb34){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
        u_xlat35 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat36 = unity_LightAtten[1].z * u_xlat35 + 1.0;
        u_xlat36 = float(1.0) / u_xlat36;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(unity_LightPosition[1].w!=0.0);
#else
        u_xlatb4 = unity_LightPosition[1].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightAtten[1].w<u_xlat35);
#else
        u_xlatb15 = unity_LightAtten[1].w<u_xlat35;
#endif
        u_xlatb4 = u_xlatb15 && u_xlatb4;
        u_xlat16_8.x = (u_xlatb4) ? 0.0 : u_xlat36;
        u_xlat35 = max(u_xlat35, 9.99999997e-07);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat4.xyz = vec3(u_xlat35) * u_xlat3.xyz;
        u_xlat36 = dot(u_xlat4.xyz, unity_SpotDirection[1].xyz);
        u_xlat36 = max(u_xlat36, 0.0);
        u_xlat16_19.x = u_xlat36 + (-unity_LightAtten[1].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb36 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat35) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[1].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb36)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati33 = 2;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(u_xlati33<unity_VertexLightParams.x);
#else
    u_xlatb35 = u_xlati33<unity_VertexLightParams.x;
#endif
    u_xlatb34 = u_xlatb34 && u_xlatb35;
    if(u_xlatb34){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
        u_xlat35 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat36 = unity_LightAtten[2].z * u_xlat35 + 1.0;
        u_xlat36 = float(1.0) / u_xlat36;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(unity_LightPosition[2].w!=0.0);
#else
        u_xlatb4 = unity_LightPosition[2].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightAtten[2].w<u_xlat35);
#else
        u_xlatb15 = unity_LightAtten[2].w<u_xlat35;
#endif
        u_xlatb4 = u_xlatb15 && u_xlatb4;
        u_xlat16_8.x = (u_xlatb4) ? 0.0 : u_xlat36;
        u_xlat35 = max(u_xlat35, 9.99999997e-07);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat4.xyz = vec3(u_xlat35) * u_xlat3.xyz;
        u_xlat36 = dot(u_xlat4.xyz, unity_SpotDirection[2].xyz);
        u_xlat36 = max(u_xlat36, 0.0);
        u_xlat16_19.x = u_xlat36 + (-unity_LightAtten[2].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[2].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb36 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat35) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[2].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb36)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati33 = 3;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(u_xlati33<unity_VertexLightParams.x);
#else
    u_xlatb35 = u_xlati33<unity_VertexLightParams.x;
#endif
    u_xlatb34 = u_xlatb34 && u_xlatb35;
    if(u_xlatb34){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
        u_xlat35 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat36 = unity_LightAtten[3].z * u_xlat35 + 1.0;
        u_xlat36 = float(1.0) / u_xlat36;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(unity_LightPosition[3].w!=0.0);
#else
        u_xlatb4 = unity_LightPosition[3].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightAtten[3].w<u_xlat35);
#else
        u_xlatb15 = unity_LightAtten[3].w<u_xlat35;
#endif
        u_xlatb4 = u_xlatb15 && u_xlatb4;
        u_xlat16_8.x = (u_xlatb4) ? 0.0 : u_xlat36;
        u_xlat35 = max(u_xlat35, 9.99999997e-07);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat4.xyz = vec3(u_xlat35) * u_xlat3.xyz;
        u_xlat36 = dot(u_xlat4.xyz, unity_SpotDirection[3].xyz);
        u_xlat36 = max(u_xlat36, 0.0);
        u_xlat16_19.x = u_xlat36 + (-unity_LightAtten[3].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb36 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat35) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[3].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb36)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati33 = 4;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(u_xlati33<unity_VertexLightParams.x);
#else
    u_xlatb35 = u_xlati33<unity_VertexLightParams.x;
#endif
    u_xlatb34 = u_xlatb34 && u_xlatb35;
    if(u_xlatb34){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
        u_xlat35 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat36 = unity_LightAtten[4].z * u_xlat35 + 1.0;
        u_xlat36 = float(1.0) / u_xlat36;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(unity_LightPosition[4].w!=0.0);
#else
        u_xlatb4 = unity_LightPosition[4].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightAtten[4].w<u_xlat35);
#else
        u_xlatb15 = unity_LightAtten[4].w<u_xlat35;
#endif
        u_xlatb4 = u_xlatb15 && u_xlatb4;
        u_xlat16_8.x = (u_xlatb4) ? 0.0 : u_xlat36;
        u_xlat35 = max(u_xlat35, 9.99999997e-07);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat4.xyz = vec3(u_xlat35) * u_xlat3.xyz;
        u_xlat36 = dot(u_xlat4.xyz, unity_SpotDirection[4].xyz);
        u_xlat36 = max(u_xlat36, 0.0);
        u_xlat16_19.x = u_xlat36 + (-unity_LightAtten[4].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb36 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat35) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[4].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb36)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati33 = 5;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(u_xlati33<unity_VertexLightParams.x);
#else
    u_xlatb35 = u_xlati33<unity_VertexLightParams.x;
#endif
    u_xlatb34 = u_xlatb34 && u_xlatb35;
    if(u_xlatb34){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
        u_xlat35 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat36 = unity_LightAtten[5].z * u_xlat35 + 1.0;
        u_xlat36 = float(1.0) / u_xlat36;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(unity_LightPosition[5].w!=0.0);
#else
        u_xlatb4 = unity_LightPosition[5].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightAtten[5].w<u_xlat35);
#else
        u_xlatb15 = unity_LightAtten[5].w<u_xlat35;
#endif
        u_xlatb4 = u_xlatb15 && u_xlatb4;
        u_xlat16_8.x = (u_xlatb4) ? 0.0 : u_xlat36;
        u_xlat35 = max(u_xlat35, 9.99999997e-07);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat4.xyz = vec3(u_xlat35) * u_xlat3.xyz;
        u_xlat36 = dot(u_xlat4.xyz, unity_SpotDirection[5].xyz);
        u_xlat36 = max(u_xlat36, 0.0);
        u_xlat16_19.x = u_xlat36 + (-unity_LightAtten[5].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb36 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat35) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[5].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb36)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati33 = 6;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(u_xlati33<unity_VertexLightParams.x);
#else
    u_xlatb35 = u_xlati33<unity_VertexLightParams.x;
#endif
    u_xlatb34 = u_xlatb34 && u_xlatb35;
    if(u_xlatb34){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
        u_xlat35 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat36 = unity_LightAtten[6].z * u_xlat35 + 1.0;
        u_xlat36 = float(1.0) / u_xlat36;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(unity_LightPosition[6].w!=0.0);
#else
        u_xlatb4 = unity_LightPosition[6].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightAtten[6].w<u_xlat35);
#else
        u_xlatb15 = unity_LightAtten[6].w<u_xlat35;
#endif
        u_xlatb4 = u_xlatb15 && u_xlatb4;
        u_xlat16_8.x = (u_xlatb4) ? 0.0 : u_xlat36;
        u_xlat35 = max(u_xlat35, 9.99999997e-07);
        u_xlat35 = inversesqrt(u_xlat35);
        u_xlat4.xyz = vec3(u_xlat35) * u_xlat3.xyz;
        u_xlat36 = dot(u_xlat4.xyz, unity_SpotDirection[6].xyz);
        u_xlat36 = max(u_xlat36, 0.0);
        u_xlat16_19.x = u_xlat36 + (-unity_LightAtten[6].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb36 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat35) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[6].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb36)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati33 = 7;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb33 = !!(u_xlati33<unity_VertexLightParams.x);
#else
    u_xlatb33 = u_xlati33<unity_VertexLightParams.x;
#endif
    u_xlatb33 = u_xlatb33 && u_xlatb34;
    if(u_xlatb33){
        u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
        u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat34 = unity_LightAtten[7].z * u_xlat33 + 1.0;
        u_xlat34 = float(1.0) / u_xlat34;
#ifdef UNITY_ADRENO_ES3
        u_xlatb35 = !!(unity_LightPosition[7].w!=0.0);
#else
        u_xlatb35 = unity_LightPosition[7].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(unity_LightAtten[7].w<u_xlat33);
#else
        u_xlatb3 = unity_LightAtten[7].w<u_xlat33;
#endif
        u_xlatb35 = u_xlatb35 && u_xlatb3;
        u_xlat16_8.x = (u_xlatb35) ? 0.0 : u_xlat34;
        u_xlat33 = max(u_xlat33, 9.99999997e-07);
        u_xlat33 = inversesqrt(u_xlat33);
        u_xlat3.xyz = vec3(u_xlat33) * u_xlat0.xyz;
        u_xlat34 = dot(u_xlat3.xyz, unity_SpotDirection[7].xyz);
        u_xlat34 = max(u_xlat34, 0.0);
        u_xlat16_19.x = u_xlat34 + (-unity_LightAtten[7].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat3.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb34 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb34 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat0.xyz * vec3(u_xlat33) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_7 = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_7 = exp2(u_xlat16_7);
        u_xlat16_7 = min(u_xlat16_7, 1.0);
        u_xlat16_7 = u_xlat16_7 * u_xlat16_8.x;
        u_xlat16_19.xyz = vec3(u_xlat16_7) * unity_LightColor[7].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb34)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_9.xyz * _SpecColor.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR1.xyz = min(max(vs_COLOR1.xyz, 0.0), 1.0);
#else
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.xyz = u_xlat16_18.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Illum;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_COLOR1;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying mediump float vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
int u_xlati2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
bool u_xlatb13;
mediump vec3 u_xlat16_18;
float u_xlat33;
float u_xlat34;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat33);
    u_xlat16_7 = _Shininess * 128.0;
    u_xlat16_18.x = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat16_18.z = float(0.0);
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat16_41 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_41 = max(u_xlat16_41, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_41) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb13 = 0.0<u_xlat16_41;
        if(u_xlatb13){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat34) + unity_LightPosition[u_xlati_loop_1].xyz;
            u_xlat16_41 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = inversesqrt(u_xlat16_41);
            u_xlat16_10.xyz = vec3(u_xlat16_41) * u_xlat16_10.xyz;
            u_xlat16_41 = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = max(u_xlat16_41, 0.0);
            u_xlat16_41 = log2(u_xlat16_41);
            u_xlat16_41 = u_xlat16_7 * u_xlat16_41;
            u_xlat16_41 = exp2(u_xlat16_41);
            u_xlat16_41 = min(u_xlat16_41, 1.0);
            u_xlat16_41 = u_xlat16_41 * 0.5;
            u_xlat16_8.xyz = vec3(u_xlat16_41) * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        }
        u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat16_18.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = sqrt(u_xlat33);
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
    vs_TEXCOORD2 = u_xlat0.x;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Illum;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying mediump float vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0.x = texture2D(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat10_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat16_1.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying mediump float vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
int u_xlati2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
bool u_xlatb13;
mediump vec3 u_xlat16_18;
float u_xlat33;
float u_xlat34;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat33);
    u_xlat16_7 = _Shininess * 128.0;
    u_xlat16_18.x = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat16_18.z = float(0.0);
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat16_41 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_41 = max(u_xlat16_41, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_41) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb13 = 0.0<u_xlat16_41;
        if(u_xlatb13){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat34) + unity_LightPosition[u_xlati_loop_1].xyz;
            u_xlat16_41 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = inversesqrt(u_xlat16_41);
            u_xlat16_10.xyz = vec3(u_xlat16_41) * u_xlat16_10.xyz;
            u_xlat16_41 = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = max(u_xlat16_41, 0.0);
            u_xlat16_41 = log2(u_xlat16_41);
            u_xlat16_41 = u_xlat16_7 * u_xlat16_41;
            u_xlat16_41 = exp2(u_xlat16_41);
            u_xlat16_41 = min(u_xlat16_41, 1.0);
            u_xlat16_41 = u_xlat16_41 * 0.5;
            u_xlat16_8.xyz = vec3(u_xlat16_41) * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        }
        u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat16_18.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = sqrt(u_xlat33);
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
    vs_TEXCOORD2 = u_xlat0.x;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Illum;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying mediump float vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0.x = texture2D(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat10_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat16_1.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying mediump float vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
int u_xlati2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
bool u_xlatb13;
mediump vec3 u_xlat16_18;
float u_xlat33;
float u_xlat34;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat33);
    u_xlat16_7 = _Shininess * 128.0;
    u_xlat16_18.x = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat16_18.z = float(0.0);
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat16_41 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_41 = max(u_xlat16_41, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_41) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb13 = 0.0<u_xlat16_41;
        if(u_xlatb13){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat34) + unity_LightPosition[u_xlati_loop_1].xyz;
            u_xlat16_41 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = inversesqrt(u_xlat16_41);
            u_xlat16_10.xyz = vec3(u_xlat16_41) * u_xlat16_10.xyz;
            u_xlat16_41 = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = max(u_xlat16_41, 0.0);
            u_xlat16_41 = log2(u_xlat16_41);
            u_xlat16_41 = u_xlat16_7 * u_xlat16_41;
            u_xlat16_41 = exp2(u_xlat16_41);
            u_xlat16_41 = min(u_xlat16_41, 1.0);
            u_xlat16_41 = u_xlat16_41 * 0.5;
            u_xlat16_8.xyz = vec3(u_xlat16_41) * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        }
        u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat16_18.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = sqrt(u_xlat33);
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
    vs_TEXCOORD2 = u_xlat0.x;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Illum;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying mediump float vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0.x = texture2D(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat10_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat16_1.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_COLOR1;
out mediump float vs_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
int u_xlati2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
bool u_xlatb13;
mediump vec3 u_xlat16_18;
float u_xlat33;
float u_xlat34;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat33);
    u_xlat16_7 = _Shininess * 128.0;
    u_xlat16_18.x = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat16_18.z = float(0.0);
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_41 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_41 = max(u_xlat16_41, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_41) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(0.0<u_xlat16_41);
#else
        u_xlatb13 = 0.0<u_xlat16_41;
#endif
        if(u_xlatb13){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat34) + unity_LightPosition[u_xlati_loop_1].xyz;
            u_xlat16_41 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = inversesqrt(u_xlat16_41);
            u_xlat16_10.xyz = vec3(u_xlat16_41) * u_xlat16_10.xyz;
            u_xlat16_41 = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = max(u_xlat16_41, 0.0);
            u_xlat16_41 = log2(u_xlat16_41);
            u_xlat16_41 = u_xlat16_7 * u_xlat16_41;
            u_xlat16_41 = exp2(u_xlat16_41);
            u_xlat16_41 = min(u_xlat16_41, 1.0);
            u_xlat16_41 = u_xlat16_41 * 0.5;
            u_xlat16_8.xyz = vec3(u_xlat16_41) * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        }
        u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR1.xyz = min(max(vs_COLOR1.xyz, 0.0), 1.0);
#else
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.xyz = u_xlat16_18.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = sqrt(u_xlat33);
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
    vs_TEXCOORD2 = u_xlat0.x;
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
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Illum;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_COLOR1;
in mediump float vs_TEXCOORD2;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat16_1.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_COLOR1;
out mediump float vs_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
int u_xlati2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
bool u_xlatb13;
mediump vec3 u_xlat16_18;
float u_xlat33;
float u_xlat34;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat33);
    u_xlat16_7 = _Shininess * 128.0;
    u_xlat16_18.x = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat16_18.z = float(0.0);
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_41 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_41 = max(u_xlat16_41, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_41) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(0.0<u_xlat16_41);
#else
        u_xlatb13 = 0.0<u_xlat16_41;
#endif
        if(u_xlatb13){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat34) + unity_LightPosition[u_xlati_loop_1].xyz;
            u_xlat16_41 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = inversesqrt(u_xlat16_41);
            u_xlat16_10.xyz = vec3(u_xlat16_41) * u_xlat16_10.xyz;
            u_xlat16_41 = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = max(u_xlat16_41, 0.0);
            u_xlat16_41 = log2(u_xlat16_41);
            u_xlat16_41 = u_xlat16_7 * u_xlat16_41;
            u_xlat16_41 = exp2(u_xlat16_41);
            u_xlat16_41 = min(u_xlat16_41, 1.0);
            u_xlat16_41 = u_xlat16_41 * 0.5;
            u_xlat16_8.xyz = vec3(u_xlat16_41) * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        }
        u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR1.xyz = min(max(vs_COLOR1.xyz, 0.0), 1.0);
#else
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.xyz = u_xlat16_18.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = sqrt(u_xlat33);
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
    vs_TEXCOORD2 = u_xlat0.x;
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
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Illum;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_COLOR1;
in mediump float vs_TEXCOORD2;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat16_1.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_COLOR1;
out mediump float vs_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
int u_xlati2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
bool u_xlatb13;
mediump vec3 u_xlat16_18;
float u_xlat33;
float u_xlat34;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat33);
    u_xlat16_7 = _Shininess * 128.0;
    u_xlat16_18.x = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat16_18.z = float(0.0);
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<unity_VertexLightParams.x ; u_xlati_loop_1++)
    {
        u_xlat16_41 = dot(u_xlat1.xyz, unity_LightPosition[u_xlati_loop_1].xyz);
        u_xlat16_41 = max(u_xlat16_41, 0.0);
        u_xlat16_9.xyz = vec3(u_xlat16_41) * _Color.xyz;
        u_xlat16_9.xyz = u_xlat16_9.xyz * unity_LightColor[u_xlati_loop_1].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(0.0<u_xlat16_41);
#else
        u_xlatb13 = 0.0<u_xlat16_41;
#endif
        if(u_xlatb13){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat34) + unity_LightPosition[u_xlati_loop_1].xyz;
            u_xlat16_41 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = inversesqrt(u_xlat16_41);
            u_xlat16_10.xyz = vec3(u_xlat16_41) * u_xlat16_10.xyz;
            u_xlat16_41 = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_41 = max(u_xlat16_41, 0.0);
            u_xlat16_41 = log2(u_xlat16_41);
            u_xlat16_41 = u_xlat16_7 * u_xlat16_41;
            u_xlat16_41 = exp2(u_xlat16_41);
            u_xlat16_41 = min(u_xlat16_41, 1.0);
            u_xlat16_41 = u_xlat16_41 * 0.5;
            u_xlat16_8.xyz = vec3(u_xlat16_41) * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        }
        u_xlat16_9.xyz = u_xlat16_9.xyz * vec3(0.5, 0.5, 0.5);
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR1.xyz = min(max(vs_COLOR1.xyz, 0.0), 1.0);
#else
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.xyz = u_xlat16_18.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = sqrt(u_xlat33);
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
    vs_TEXCOORD2 = u_xlat0.x;
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
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Illum;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_COLOR1;
in mediump float vs_TEXCOORD2;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat16_1.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying mediump float vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
int u_xlati2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat13;
bool u_xlatb13;
float u_xlat14;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_20;
bool u_xlatb25;
float u_xlat33;
float u_xlat34;
bool u_xlatb36;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat33);
    u_xlat16_7 = _Shininess * 128.0;
    u_xlat16_18.x = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat16_18.z = float(0.0);
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat13.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat3.x = dot(u_xlat13.xyz, u_xlat13.xyz);
        u_xlat14 = unity_LightAtten[u_xlati_loop_1].z * u_xlat3.x + 1.0;
        u_xlat14 = float(1.0) / u_xlat14;
        u_xlatb25 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb36 = unity_LightAtten[u_xlati_loop_1].w<u_xlat3.x;
        u_xlatb25 = u_xlatb36 && u_xlatb25;
        u_xlat3.x = max(u_xlat3.x, 9.99999997e-07);
        u_xlat3.x = inversesqrt(u_xlat3.x);
        u_xlat13.xyz = u_xlat13.xyz * u_xlat3.xxx;
        u_xlat3.x = u_xlat14 * 0.5;
        u_xlat16_41 = (u_xlatb25) ? 0.0 : u_xlat3.x;
        u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat13.xyz);
        u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
        u_xlat16_20.xyz = u_xlat16_9.xxx * _Color.xyz;
        u_xlat16_20.xyz = u_xlat16_20.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb3 = 0.0<u_xlat16_9.x;
        if(u_xlatb3){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat34) + u_xlat13.xyz;
            u_xlat16_9.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
            u_xlat16_10.xyz = u_xlat16_9.xxx * u_xlat16_10.xyz;
            u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
            u_xlat16_9.x = log2(u_xlat16_9.x);
            u_xlat16_9.x = u_xlat16_7 * u_xlat16_9.x;
            u_xlat16_9.x = exp2(u_xlat16_9.x);
            u_xlat16_9.x = min(u_xlat16_9.x, 1.0);
            u_xlat16_9.x = u_xlat16_41 * u_xlat16_9.x;
            u_xlat16_8.xyz = u_xlat16_9.xxx * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        }
        u_xlat16_9.xyz = vec3(u_xlat16_41) * u_xlat16_20.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat16_18.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = sqrt(u_xlat33);
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
    vs_TEXCOORD2 = u_xlat0.x;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Illum;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying mediump float vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0.x = texture2D(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat10_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat16_1.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying mediump float vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
int u_xlati2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat13;
bool u_xlatb13;
float u_xlat14;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_20;
bool u_xlatb25;
float u_xlat33;
float u_xlat34;
bool u_xlatb36;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat33);
    u_xlat16_7 = _Shininess * 128.0;
    u_xlat16_18.x = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat16_18.z = float(0.0);
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat13.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat3.x = dot(u_xlat13.xyz, u_xlat13.xyz);
        u_xlat14 = unity_LightAtten[u_xlati_loop_1].z * u_xlat3.x + 1.0;
        u_xlat14 = float(1.0) / u_xlat14;
        u_xlatb25 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb36 = unity_LightAtten[u_xlati_loop_1].w<u_xlat3.x;
        u_xlatb25 = u_xlatb36 && u_xlatb25;
        u_xlat3.x = max(u_xlat3.x, 9.99999997e-07);
        u_xlat3.x = inversesqrt(u_xlat3.x);
        u_xlat13.xyz = u_xlat13.xyz * u_xlat3.xxx;
        u_xlat3.x = u_xlat14 * 0.5;
        u_xlat16_41 = (u_xlatb25) ? 0.0 : u_xlat3.x;
        u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat13.xyz);
        u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
        u_xlat16_20.xyz = u_xlat16_9.xxx * _Color.xyz;
        u_xlat16_20.xyz = u_xlat16_20.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb3 = 0.0<u_xlat16_9.x;
        if(u_xlatb3){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat34) + u_xlat13.xyz;
            u_xlat16_9.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
            u_xlat16_10.xyz = u_xlat16_9.xxx * u_xlat16_10.xyz;
            u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
            u_xlat16_9.x = log2(u_xlat16_9.x);
            u_xlat16_9.x = u_xlat16_7 * u_xlat16_9.x;
            u_xlat16_9.x = exp2(u_xlat16_9.x);
            u_xlat16_9.x = min(u_xlat16_9.x, 1.0);
            u_xlat16_9.x = u_xlat16_41 * u_xlat16_9.x;
            u_xlat16_8.xyz = u_xlat16_9.xxx * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        }
        u_xlat16_9.xyz = vec3(u_xlat16_41) * u_xlat16_20.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat16_18.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = sqrt(u_xlat33);
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
    vs_TEXCOORD2 = u_xlat0.x;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Illum;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying mediump float vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0.x = texture2D(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat10_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat16_1.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying mediump float vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
int u_xlati2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat13;
bool u_xlatb13;
float u_xlat14;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_20;
bool u_xlatb25;
float u_xlat33;
float u_xlat34;
bool u_xlatb36;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat33);
    u_xlat16_7 = _Shininess * 128.0;
    u_xlat16_18.x = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat16_18.z = float(0.0);
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat13.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat3.x = dot(u_xlat13.xyz, u_xlat13.xyz);
        u_xlat14 = unity_LightAtten[u_xlati_loop_1].z * u_xlat3.x + 1.0;
        u_xlat14 = float(1.0) / u_xlat14;
        u_xlatb25 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb36 = unity_LightAtten[u_xlati_loop_1].w<u_xlat3.x;
        u_xlatb25 = u_xlatb36 && u_xlatb25;
        u_xlat3.x = max(u_xlat3.x, 9.99999997e-07);
        u_xlat3.x = inversesqrt(u_xlat3.x);
        u_xlat13.xyz = u_xlat13.xyz * u_xlat3.xxx;
        u_xlat3.x = u_xlat14 * 0.5;
        u_xlat16_41 = (u_xlatb25) ? 0.0 : u_xlat3.x;
        u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat13.xyz);
        u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
        u_xlat16_20.xyz = u_xlat16_9.xxx * _Color.xyz;
        u_xlat16_20.xyz = u_xlat16_20.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb3 = 0.0<u_xlat16_9.x;
        if(u_xlatb3){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat34) + u_xlat13.xyz;
            u_xlat16_9.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
            u_xlat16_10.xyz = u_xlat16_9.xxx * u_xlat16_10.xyz;
            u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
            u_xlat16_9.x = log2(u_xlat16_9.x);
            u_xlat16_9.x = u_xlat16_7 * u_xlat16_9.x;
            u_xlat16_9.x = exp2(u_xlat16_9.x);
            u_xlat16_9.x = min(u_xlat16_9.x, 1.0);
            u_xlat16_9.x = u_xlat16_41 * u_xlat16_9.x;
            u_xlat16_8.xyz = u_xlat16_9.xxx * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        }
        u_xlat16_9.xyz = vec3(u_xlat16_41) * u_xlat16_20.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat16_18.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = sqrt(u_xlat33);
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
    vs_TEXCOORD2 = u_xlat0.x;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Illum;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying mediump float vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0.x = texture2D(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat10_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat16_1.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_COLOR1;
out mediump float vs_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
bool u_xlatb12;
float u_xlat13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
bool u_xlatb16;
float u_xlat17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat21;
mediump vec3 u_xlat16_22;
int u_xlati24;
bool u_xlatb24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat28;
vec3 u_xlat29;
bool u_xlatb29;
vec3 u_xlat31;
vec3 u_xlat32;
bool u_xlatb32;
vec3 u_xlat35;
vec3 u_xlat36;
bool u_xlatb36;
mediump float u_xlat16_41;
bool u_xlatb43;
mediump float u_xlat16_44;
mediump float u_xlat16_45;
float u_xlat48;
bool u_xlatb48;
float u_xlat51;
bool u_xlatb51;
float u_xlat55;
bool u_xlatb55;
float u_xlat58;
float u_xlat61;
float u_xlat62;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
bool u_xlatb65;
float u_xlat67;
bool u_xlatb68;
float u_xlat70;
bool u_xlatb72;
float u_xlat74;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat19.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat19.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat19.xyz;
    u_xlat19.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat19.xyz;
    u_xlat19.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat19.xyz;
    u_xlat19.xyz = u_xlat19.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat19.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat19.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat19.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat19.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat19.xyz = u_xlat19.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat19.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat58 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat58);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat58;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat58 + 1.0;
    u_xlat58 = max(u_xlat58, 9.99999997e-07);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.5;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat2.x;
    u_xlat2.xyz = vec3(u_xlat58) * u_xlat1.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat4.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat4.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat5.xyz;
    u_xlat4.z = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat16_22.x = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0);
    u_xlat16_6.xyz = u_xlat16_22.xxx * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<u_xlat16_22.x);
#else
    u_xlatb0 = 0.0<u_xlat16_22.x;
#endif
    u_xlat16_22.xyz = u_xlat16_6.xyz * unity_LightColor[1].xyz;
    u_xlat16_22.xyz = u_xlat16_3.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = min(u_xlat16_22.xyz, vec3(1.0, 1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlat21.xyz = (-u_xlat19.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat61 = dot(u_xlat21.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(unity_LightAtten[0].w<u_xlat61);
#else
    u_xlatb5 = unity_LightAtten[0].w<u_xlat61;
#endif
    u_xlatb2 = u_xlatb2 && u_xlatb5;
    u_xlat5.x = unity_LightAtten[0].z * u_xlat61 + 1.0;
    u_xlat61 = max(u_xlat61, 9.99999997e-07);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * 0.5;
    u_xlat16_6.x = (u_xlatb2) ? 0.0 : u_xlat5.x;
    u_xlat5.xyz = u_xlat21.xyz * vec3(u_xlat61);
    u_xlat16_25.x = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat16_25.x = max(u_xlat16_25.x, 0.0);
    u_xlat16_7.xyz = u_xlat16_25.xxx * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<u_xlat16_25.x);
#else
    u_xlatb2 = 0.0<u_xlat16_25.x;
#endif
    u_xlat16_25.xyz = u_xlat16_7.xyz * unity_LightColor[0].xyz;
    u_xlat16_25.xyz = u_xlat16_6.xxx * u_xlat16_25.xyz;
    u_xlat16_25.xyz = min(u_xlat16_25.xyz, vec3(1.0, 1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb5 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_25.xyz = (bool(u_xlatb5)) ? u_xlat16_25.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_22.xyz = u_xlat16_22.xyz + u_xlat16_25.xyz;
    u_xlati24 = u_xlatb5 ? 1 : int(0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb43 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb43 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlati24 = (u_xlatb43) ? 2 : u_xlati24;
    u_xlat16_22.xyz = (bool(u_xlatb43)) ? u_xlat16_22.xyz : u_xlat16_25.xyz;
    u_xlat8.xyz = (-u_xlat19.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat62 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(unity_LightAtten[2].w<u_xlat62);
#else
    u_xlatb65 = unity_LightAtten[2].w<u_xlat62;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb9 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb65 = u_xlatb65 && u_xlatb9;
    u_xlat9.x = unity_LightAtten[2].z * u_xlat62 + 1.0;
    u_xlat62 = max(u_xlat62, 9.99999997e-07);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat9.x = float(1.0) / u_xlat9.x;
    u_xlat9.x = u_xlat9.x * 0.5;
    u_xlat16_25.x = (u_xlatb65) ? 0.0 : u_xlat9.x;
    u_xlat9.xyz = vec3(u_xlat62) * u_xlat8.xyz;
    u_xlat16_44 = dot(u_xlat4.xyz, u_xlat9.xyz);
    u_xlat16_44 = max(u_xlat16_44, 0.0);
    u_xlat16_7.xyz = vec3(u_xlat16_44) * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(0.0<u_xlat16_44);
#else
    u_xlatb65 = 0.0<u_xlat16_44;
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * unity_LightColor[2].xyz;
    u_xlat16_7.xyz = u_xlat16_25.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = min(u_xlat16_7.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_7.xyz = u_xlat16_22.xyz + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb9 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb9 = u_xlatb43 && u_xlatb9;
    u_xlat16_22.xyz = (bool(u_xlatb9)) ? u_xlat16_7.xyz : u_xlat16_22.xyz;
    u_xlat28.xyz = (-u_xlat19.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat10 = dot(u_xlat28.xyz, u_xlat28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(unity_LightAtten[3].w<u_xlat10);
#else
    u_xlatb29 = unity_LightAtten[3].w<u_xlat10;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb48 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb29 = u_xlatb29 && u_xlatb48;
    u_xlat48 = unity_LightAtten[3].z * u_xlat10 + 1.0;
    u_xlat10 = max(u_xlat10, 9.99999997e-07);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat48 = float(1.0) / u_xlat48;
    u_xlat48 = u_xlat48 * 0.5;
    u_xlat16_44 = (u_xlatb29) ? 0.0 : u_xlat48;
    u_xlat29.xyz = u_xlat28.xyz * vec3(u_xlat10);
    u_xlat16_63 = dot(u_xlat4.xyz, u_xlat29.xyz);
    u_xlat16_63 = max(u_xlat16_63, 0.0);
    u_xlat16_7.xyz = vec3(u_xlat16_63) * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.0<u_xlat16_63);
#else
    u_xlatb29 = 0.0<u_xlat16_63;
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * unity_LightColor[3].xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_44) * u_xlat16_7.xyz;
    u_xlat16_7.xyz = min(u_xlat16_7.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_7.xyz = u_xlat16_22.xyz + u_xlat16_7.xyz;
    u_xlati24 = (u_xlatb9) ? 3 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb48 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb48 = u_xlatb9 && u_xlatb48;
    u_xlat16_22.xyz = (bool(u_xlatb48)) ? u_xlat16_7.xyz : u_xlat16_22.xyz;
    u_xlat11.xyz = (-u_xlat19.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat67 = dot(u_xlat11.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(unity_LightAtten[4].w<u_xlat67);
#else
    u_xlatb68 = unity_LightAtten[4].w<u_xlat67;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb12 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb68 = u_xlatb68 && u_xlatb12;
    u_xlat12.x = unity_LightAtten[4].z * u_xlat67 + 1.0;
    u_xlat67 = max(u_xlat67, 9.99999997e-07);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat12.x = u_xlat12.x * 0.5;
    u_xlat16_63 = (u_xlatb68) ? 0.0 : u_xlat12.x;
    u_xlat12.xyz = vec3(u_xlat67) * u_xlat11.xyz;
    u_xlat16_7.x = dot(u_xlat4.xyz, u_xlat12.xyz);
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_26.xyz = u_xlat16_7.xxx * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.0<u_xlat16_7.x);
#else
    u_xlatb68 = 0.0<u_xlat16_7.x;
#endif
    u_xlat16_7.xyz = u_xlat16_26.xyz * unity_LightColor[4].xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_63) * u_xlat16_7.xyz;
    u_xlat16_7.xyz = min(u_xlat16_7.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_7.xyz = u_xlat16_22.xyz + u_xlat16_7.xyz;
    u_xlati24 = (u_xlatb48) ? 4 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb12 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb12 = u_xlatb48 && u_xlatb12;
    u_xlat16_22.xyz = (bool(u_xlatb12)) ? u_xlat16_7.xyz : u_xlat16_22.xyz;
    u_xlat31.xyz = (-u_xlat19.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat13 = dot(u_xlat31.xyz, u_xlat31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(unity_LightAtten[5].w<u_xlat13);
#else
    u_xlatb32 = unity_LightAtten[5].w<u_xlat13;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb51 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb32 = u_xlatb32 && u_xlatb51;
    u_xlat51 = unity_LightAtten[5].z * u_xlat13 + 1.0;
    u_xlat13 = max(u_xlat13, 9.99999997e-07);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat51 = float(1.0) / u_xlat51;
    u_xlat51 = u_xlat51 * 0.5;
    u_xlat16_7.x = (u_xlatb32) ? 0.0 : u_xlat51;
    u_xlat32.xyz = u_xlat31.xyz * vec3(u_xlat13);
    u_xlat16_26.x = dot(u_xlat4.xyz, u_xlat32.xyz);
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0);
    u_xlat16_14.xyz = u_xlat16_26.xxx * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(0.0<u_xlat16_26.x);
#else
    u_xlatb32 = 0.0<u_xlat16_26.x;
#endif
    u_xlat16_26.xyz = u_xlat16_14.xyz * unity_LightColor[5].xyz;
    u_xlat16_26.xyz = u_xlat16_7.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = min(u_xlat16_26.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_26.xyz = u_xlat16_22.xyz + u_xlat16_26.xyz;
    u_xlati24 = (u_xlatb12) ? 5 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb51 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb51 = u_xlatb12 && u_xlatb51;
    u_xlat16_22.xyz = (bool(u_xlatb51)) ? u_xlat16_26.xyz : u_xlat16_22.xyz;
    u_xlat15.xyz = (-u_xlat19.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat70 = dot(u_xlat15.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(unity_LightAtten[6].w<u_xlat70);
#else
    u_xlatb72 = unity_LightAtten[6].w<u_xlat70;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb16 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb72 = u_xlatb72 && u_xlatb16;
    u_xlat16.x = unity_LightAtten[6].z * u_xlat70 + 1.0;
    u_xlat70 = max(u_xlat70, 9.99999997e-07);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat16.x = float(1.0) / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.5;
    u_xlat16_26.x = (u_xlatb72) ? 0.0 : u_xlat16.x;
    u_xlat16.xyz = vec3(u_xlat70) * u_xlat15.xyz;
    u_xlat16_45 = dot(u_xlat4.xyz, u_xlat16.xyz);
    u_xlat16_45 = max(u_xlat16_45, 0.0);
    u_xlat16_14.xyz = vec3(u_xlat16_45) * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(0.0<u_xlat16_45);
#else
    u_xlatb72 = 0.0<u_xlat16_45;
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz * unity_LightColor[6].xyz;
    u_xlat16_14.xyz = u_xlat16_26.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = min(u_xlat16_14.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_14.xyz = u_xlat16_22.xyz + u_xlat16_14.xyz;
    u_xlati24 = (u_xlatb51) ? 6 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb16 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb16 = u_xlatb51 && u_xlatb16;
    u_xlat16_22.xyz = (bool(u_xlatb16)) ? u_xlat16_14.xyz : u_xlat16_22.xyz;
    u_xlat35.xyz = (-u_xlat19.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat17 = dot(u_xlat35.xyz, u_xlat35.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(unity_LightAtten[7].w<u_xlat17);
#else
    u_xlatb36 = unity_LightAtten[7].w<u_xlat17;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb55 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb36 = u_xlatb36 && u_xlatb55;
    u_xlat55 = unity_LightAtten[7].z * u_xlat17 + 1.0;
    u_xlat17 = max(u_xlat17, 9.99999997e-07);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat55 = float(1.0) / u_xlat55;
    u_xlat55 = u_xlat55 * 0.5;
    u_xlat16_45 = (u_xlatb36) ? 0.0 : u_xlat55;
    u_xlat36.xyz = u_xlat35.xyz * vec3(u_xlat17);
    u_xlat16_64 = dot(u_xlat4.xyz, u_xlat36.xyz);
    u_xlat16_64 = max(u_xlat16_64, 0.0);
    u_xlat16_14.xyz = vec3(u_xlat16_64) * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<u_xlat16_64);
#else
    u_xlatb36 = 0.0<u_xlat16_64;
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz * unity_LightColor[7].xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_45) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = min(u_xlat16_14.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_14.xyz = u_xlat16_22.xyz + u_xlat16_14.xyz;
    u_xlati24 = (u_xlatb16) ? 7 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb24 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb24 = u_xlatb24 && u_xlatb16;
    vs_COLOR0.xyz = (bool(u_xlatb24)) ? u_xlat16_14.xyz : u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    u_xlat55 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat74 = inversesqrt(u_xlat55);
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat55 * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    vs_TEXCOORD2 = u_xlat55;
    u_xlat19.xyz = u_xlat19.xyz * vec3(u_xlat74);
    u_xlat16_22.xyz = u_xlat21.xyz * vec3(u_xlat61) + (-u_xlat19.xyz);
    u_xlat16_64 = dot(u_xlat16_22.xyz, u_xlat16_22.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(u_xlat16_64);
    u_xlat16_22.x = dot(u_xlat4.xyz, u_xlat16_22.xyz);
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0);
    u_xlat16_22.x = log2(u_xlat16_22.x);
    u_xlat16_41 = _Shininess * 128.0;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_41;
    u_xlat16_22.x = exp2(u_xlat16_22.x);
    u_xlat16_22.x = min(u_xlat16_22.x, 1.0);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_6.x;
    u_xlat16_14.xyz = u_xlat16_22.xxx * unity_LightColor[0].xyz;
    u_xlat16_14.xyz = (bool(u_xlatb2)) ? u_xlat16_14.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_14.xyz = (bool(u_xlatb5)) ? u_xlat16_14.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_18.xyz = u_xlat1.xyz * vec3(u_xlat58) + (-u_xlat19.xyz);
    u_xlat16_22.x = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_22.x = inversesqrt(u_xlat16_22.x);
    u_xlat16_18.xyz = u_xlat16_22.xxx * u_xlat16_18.xyz;
    u_xlat16_22.x = dot(u_xlat4.xyz, u_xlat16_18.xyz);
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0);
    u_xlat16_22.x = log2(u_xlat16_22.x);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_41;
    u_xlat16_22.x = exp2(u_xlat16_22.x);
    u_xlat16_22.x = min(u_xlat16_22.x, 1.0);
    u_xlat16_3.x = u_xlat16_22.x * u_xlat16_3.x;
    u_xlat16_3.xyw = u_xlat16_3.xxx * unity_LightColor[1].xyz + u_xlat16_14.xyz;
    u_xlat16_3.xyw = (bool(u_xlatb0)) ? u_xlat16_3.xyw : u_xlat16_14.xyz;
    u_xlat16_3.xyw = (bool(u_xlatb43)) ? u_xlat16_3.xyw : u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat8.xyz * vec3(u_xlat62) + (-u_xlat19.xyz);
    u_xlat16_6.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_14.xyz = u_xlat16_6.xxx * u_xlat16_14.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_25.x;
    u_xlat16_14.xyz = u_xlat16_6.xxx * unity_LightColor[2].xyz + u_xlat16_3.xyw;
    u_xlat16_14.xyz = (bool(u_xlatb65)) ? u_xlat16_14.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb9)) ? u_xlat16_14.xyz : u_xlat16_3.xyw;
    u_xlat16_14.xyz = u_xlat28.xyz * vec3(u_xlat10) + (-u_xlat19.xyz);
    u_xlat16_6.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_14.xyz = u_xlat16_6.xxx * u_xlat16_14.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_44;
    u_xlat16_6.xyz = u_xlat16_6.xxx * unity_LightColor[3].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb29)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb48)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_6.xyz = u_xlat11.xyz * vec3(u_xlat67) + (-u_xlat19.xyz);
    u_xlat16_64 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat16_64);
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_6.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_63;
    u_xlat16_6.xyz = u_xlat16_6.xxx * unity_LightColor[4].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb68)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb12)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_6.xyz = u_xlat31.xyz * vec3(u_xlat13) + (-u_xlat19.xyz);
    u_xlat16_63 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_6.xyz = vec3(u_xlat16_63) * u_xlat16_6.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_6.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_7.x;
    u_xlat16_6.xyz = u_xlat16_6.xxx * unity_LightColor[5].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb32)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb51)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_6.xyz = u_xlat15.xyz * vec3(u_xlat70) + (-u_xlat19.xyz);
    u_xlat16_14.xyz = u_xlat35.xyz * vec3(u_xlat17) + (-u_xlat19.xyz);
    u_xlat16_63 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_6.xyz = vec3(u_xlat16_63) * u_xlat16_6.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_6.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_26.x;
    u_xlat16_6.xyz = u_xlat16_6.xxx * unity_LightColor[6].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb72)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb16)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_6.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_14.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_6.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_41 = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_41 = exp2(u_xlat16_41);
    u_xlat16_41 = min(u_xlat16_41, 1.0);
    u_xlat16_41 = u_xlat16_41 * u_xlat16_45;
    u_xlat16_6.xyz = vec3(u_xlat16_41) * unity_LightColor[7].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb36)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyz = (bool(u_xlatb24)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    vs_COLOR1.xyz = u_xlat16_3.xyz * _SpecColor.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR1.xyz = min(max(vs_COLOR1.xyz, 0.0), 1.0);
#else
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Illum;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_COLOR1;
in mediump float vs_TEXCOORD2;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat16_1.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_COLOR1;
out mediump float vs_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
bool u_xlatb12;
float u_xlat13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
bool u_xlatb16;
float u_xlat17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat21;
mediump vec3 u_xlat16_22;
int u_xlati24;
bool u_xlatb24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat28;
vec3 u_xlat29;
bool u_xlatb29;
vec3 u_xlat31;
vec3 u_xlat32;
bool u_xlatb32;
vec3 u_xlat35;
vec3 u_xlat36;
bool u_xlatb36;
mediump float u_xlat16_41;
bool u_xlatb43;
mediump float u_xlat16_44;
mediump float u_xlat16_45;
float u_xlat48;
bool u_xlatb48;
float u_xlat51;
bool u_xlatb51;
float u_xlat55;
bool u_xlatb55;
float u_xlat58;
float u_xlat61;
float u_xlat62;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
bool u_xlatb65;
float u_xlat67;
bool u_xlatb68;
float u_xlat70;
bool u_xlatb72;
float u_xlat74;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat19.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat19.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat19.xyz;
    u_xlat19.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat19.xyz;
    u_xlat19.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat19.xyz;
    u_xlat19.xyz = u_xlat19.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat19.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat19.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat19.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat19.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat19.xyz = u_xlat19.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat19.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat58 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat58);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat58;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat58 + 1.0;
    u_xlat58 = max(u_xlat58, 9.99999997e-07);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.5;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat2.x;
    u_xlat2.xyz = vec3(u_xlat58) * u_xlat1.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat4.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat4.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat5.xyz;
    u_xlat4.z = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat16_22.x = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0);
    u_xlat16_6.xyz = u_xlat16_22.xxx * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<u_xlat16_22.x);
#else
    u_xlatb0 = 0.0<u_xlat16_22.x;
#endif
    u_xlat16_22.xyz = u_xlat16_6.xyz * unity_LightColor[1].xyz;
    u_xlat16_22.xyz = u_xlat16_3.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = min(u_xlat16_22.xyz, vec3(1.0, 1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlat21.xyz = (-u_xlat19.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat61 = dot(u_xlat21.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(unity_LightAtten[0].w<u_xlat61);
#else
    u_xlatb5 = unity_LightAtten[0].w<u_xlat61;
#endif
    u_xlatb2 = u_xlatb2 && u_xlatb5;
    u_xlat5.x = unity_LightAtten[0].z * u_xlat61 + 1.0;
    u_xlat61 = max(u_xlat61, 9.99999997e-07);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * 0.5;
    u_xlat16_6.x = (u_xlatb2) ? 0.0 : u_xlat5.x;
    u_xlat5.xyz = u_xlat21.xyz * vec3(u_xlat61);
    u_xlat16_25.x = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat16_25.x = max(u_xlat16_25.x, 0.0);
    u_xlat16_7.xyz = u_xlat16_25.xxx * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<u_xlat16_25.x);
#else
    u_xlatb2 = 0.0<u_xlat16_25.x;
#endif
    u_xlat16_25.xyz = u_xlat16_7.xyz * unity_LightColor[0].xyz;
    u_xlat16_25.xyz = u_xlat16_6.xxx * u_xlat16_25.xyz;
    u_xlat16_25.xyz = min(u_xlat16_25.xyz, vec3(1.0, 1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb5 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_25.xyz = (bool(u_xlatb5)) ? u_xlat16_25.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_22.xyz = u_xlat16_22.xyz + u_xlat16_25.xyz;
    u_xlati24 = u_xlatb5 ? 1 : int(0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb43 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb43 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlati24 = (u_xlatb43) ? 2 : u_xlati24;
    u_xlat16_22.xyz = (bool(u_xlatb43)) ? u_xlat16_22.xyz : u_xlat16_25.xyz;
    u_xlat8.xyz = (-u_xlat19.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat62 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(unity_LightAtten[2].w<u_xlat62);
#else
    u_xlatb65 = unity_LightAtten[2].w<u_xlat62;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb9 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb65 = u_xlatb65 && u_xlatb9;
    u_xlat9.x = unity_LightAtten[2].z * u_xlat62 + 1.0;
    u_xlat62 = max(u_xlat62, 9.99999997e-07);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat9.x = float(1.0) / u_xlat9.x;
    u_xlat9.x = u_xlat9.x * 0.5;
    u_xlat16_25.x = (u_xlatb65) ? 0.0 : u_xlat9.x;
    u_xlat9.xyz = vec3(u_xlat62) * u_xlat8.xyz;
    u_xlat16_44 = dot(u_xlat4.xyz, u_xlat9.xyz);
    u_xlat16_44 = max(u_xlat16_44, 0.0);
    u_xlat16_7.xyz = vec3(u_xlat16_44) * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(0.0<u_xlat16_44);
#else
    u_xlatb65 = 0.0<u_xlat16_44;
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * unity_LightColor[2].xyz;
    u_xlat16_7.xyz = u_xlat16_25.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = min(u_xlat16_7.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_7.xyz = u_xlat16_22.xyz + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb9 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb9 = u_xlatb43 && u_xlatb9;
    u_xlat16_22.xyz = (bool(u_xlatb9)) ? u_xlat16_7.xyz : u_xlat16_22.xyz;
    u_xlat28.xyz = (-u_xlat19.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat10 = dot(u_xlat28.xyz, u_xlat28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(unity_LightAtten[3].w<u_xlat10);
#else
    u_xlatb29 = unity_LightAtten[3].w<u_xlat10;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb48 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb29 = u_xlatb29 && u_xlatb48;
    u_xlat48 = unity_LightAtten[3].z * u_xlat10 + 1.0;
    u_xlat10 = max(u_xlat10, 9.99999997e-07);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat48 = float(1.0) / u_xlat48;
    u_xlat48 = u_xlat48 * 0.5;
    u_xlat16_44 = (u_xlatb29) ? 0.0 : u_xlat48;
    u_xlat29.xyz = u_xlat28.xyz * vec3(u_xlat10);
    u_xlat16_63 = dot(u_xlat4.xyz, u_xlat29.xyz);
    u_xlat16_63 = max(u_xlat16_63, 0.0);
    u_xlat16_7.xyz = vec3(u_xlat16_63) * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.0<u_xlat16_63);
#else
    u_xlatb29 = 0.0<u_xlat16_63;
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * unity_LightColor[3].xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_44) * u_xlat16_7.xyz;
    u_xlat16_7.xyz = min(u_xlat16_7.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_7.xyz = u_xlat16_22.xyz + u_xlat16_7.xyz;
    u_xlati24 = (u_xlatb9) ? 3 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb48 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb48 = u_xlatb9 && u_xlatb48;
    u_xlat16_22.xyz = (bool(u_xlatb48)) ? u_xlat16_7.xyz : u_xlat16_22.xyz;
    u_xlat11.xyz = (-u_xlat19.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat67 = dot(u_xlat11.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(unity_LightAtten[4].w<u_xlat67);
#else
    u_xlatb68 = unity_LightAtten[4].w<u_xlat67;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb12 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb68 = u_xlatb68 && u_xlatb12;
    u_xlat12.x = unity_LightAtten[4].z * u_xlat67 + 1.0;
    u_xlat67 = max(u_xlat67, 9.99999997e-07);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat12.x = u_xlat12.x * 0.5;
    u_xlat16_63 = (u_xlatb68) ? 0.0 : u_xlat12.x;
    u_xlat12.xyz = vec3(u_xlat67) * u_xlat11.xyz;
    u_xlat16_7.x = dot(u_xlat4.xyz, u_xlat12.xyz);
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_26.xyz = u_xlat16_7.xxx * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.0<u_xlat16_7.x);
#else
    u_xlatb68 = 0.0<u_xlat16_7.x;
#endif
    u_xlat16_7.xyz = u_xlat16_26.xyz * unity_LightColor[4].xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_63) * u_xlat16_7.xyz;
    u_xlat16_7.xyz = min(u_xlat16_7.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_7.xyz = u_xlat16_22.xyz + u_xlat16_7.xyz;
    u_xlati24 = (u_xlatb48) ? 4 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb12 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb12 = u_xlatb48 && u_xlatb12;
    u_xlat16_22.xyz = (bool(u_xlatb12)) ? u_xlat16_7.xyz : u_xlat16_22.xyz;
    u_xlat31.xyz = (-u_xlat19.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat13 = dot(u_xlat31.xyz, u_xlat31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(unity_LightAtten[5].w<u_xlat13);
#else
    u_xlatb32 = unity_LightAtten[5].w<u_xlat13;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb51 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb32 = u_xlatb32 && u_xlatb51;
    u_xlat51 = unity_LightAtten[5].z * u_xlat13 + 1.0;
    u_xlat13 = max(u_xlat13, 9.99999997e-07);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat51 = float(1.0) / u_xlat51;
    u_xlat51 = u_xlat51 * 0.5;
    u_xlat16_7.x = (u_xlatb32) ? 0.0 : u_xlat51;
    u_xlat32.xyz = u_xlat31.xyz * vec3(u_xlat13);
    u_xlat16_26.x = dot(u_xlat4.xyz, u_xlat32.xyz);
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0);
    u_xlat16_14.xyz = u_xlat16_26.xxx * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(0.0<u_xlat16_26.x);
#else
    u_xlatb32 = 0.0<u_xlat16_26.x;
#endif
    u_xlat16_26.xyz = u_xlat16_14.xyz * unity_LightColor[5].xyz;
    u_xlat16_26.xyz = u_xlat16_7.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = min(u_xlat16_26.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_26.xyz = u_xlat16_22.xyz + u_xlat16_26.xyz;
    u_xlati24 = (u_xlatb12) ? 5 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb51 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb51 = u_xlatb12 && u_xlatb51;
    u_xlat16_22.xyz = (bool(u_xlatb51)) ? u_xlat16_26.xyz : u_xlat16_22.xyz;
    u_xlat15.xyz = (-u_xlat19.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat70 = dot(u_xlat15.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(unity_LightAtten[6].w<u_xlat70);
#else
    u_xlatb72 = unity_LightAtten[6].w<u_xlat70;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb16 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb72 = u_xlatb72 && u_xlatb16;
    u_xlat16.x = unity_LightAtten[6].z * u_xlat70 + 1.0;
    u_xlat70 = max(u_xlat70, 9.99999997e-07);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat16.x = float(1.0) / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.5;
    u_xlat16_26.x = (u_xlatb72) ? 0.0 : u_xlat16.x;
    u_xlat16.xyz = vec3(u_xlat70) * u_xlat15.xyz;
    u_xlat16_45 = dot(u_xlat4.xyz, u_xlat16.xyz);
    u_xlat16_45 = max(u_xlat16_45, 0.0);
    u_xlat16_14.xyz = vec3(u_xlat16_45) * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(0.0<u_xlat16_45);
#else
    u_xlatb72 = 0.0<u_xlat16_45;
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz * unity_LightColor[6].xyz;
    u_xlat16_14.xyz = u_xlat16_26.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = min(u_xlat16_14.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_14.xyz = u_xlat16_22.xyz + u_xlat16_14.xyz;
    u_xlati24 = (u_xlatb51) ? 6 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb16 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb16 = u_xlatb51 && u_xlatb16;
    u_xlat16_22.xyz = (bool(u_xlatb16)) ? u_xlat16_14.xyz : u_xlat16_22.xyz;
    u_xlat35.xyz = (-u_xlat19.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat17 = dot(u_xlat35.xyz, u_xlat35.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(unity_LightAtten[7].w<u_xlat17);
#else
    u_xlatb36 = unity_LightAtten[7].w<u_xlat17;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb55 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb36 = u_xlatb36 && u_xlatb55;
    u_xlat55 = unity_LightAtten[7].z * u_xlat17 + 1.0;
    u_xlat17 = max(u_xlat17, 9.99999997e-07);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat55 = float(1.0) / u_xlat55;
    u_xlat55 = u_xlat55 * 0.5;
    u_xlat16_45 = (u_xlatb36) ? 0.0 : u_xlat55;
    u_xlat36.xyz = u_xlat35.xyz * vec3(u_xlat17);
    u_xlat16_64 = dot(u_xlat4.xyz, u_xlat36.xyz);
    u_xlat16_64 = max(u_xlat16_64, 0.0);
    u_xlat16_14.xyz = vec3(u_xlat16_64) * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<u_xlat16_64);
#else
    u_xlatb36 = 0.0<u_xlat16_64;
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz * unity_LightColor[7].xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_45) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = min(u_xlat16_14.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_14.xyz = u_xlat16_22.xyz + u_xlat16_14.xyz;
    u_xlati24 = (u_xlatb16) ? 7 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb24 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb24 = u_xlatb24 && u_xlatb16;
    vs_COLOR0.xyz = (bool(u_xlatb24)) ? u_xlat16_14.xyz : u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    u_xlat55 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat74 = inversesqrt(u_xlat55);
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat55 * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    vs_TEXCOORD2 = u_xlat55;
    u_xlat19.xyz = u_xlat19.xyz * vec3(u_xlat74);
    u_xlat16_22.xyz = u_xlat21.xyz * vec3(u_xlat61) + (-u_xlat19.xyz);
    u_xlat16_64 = dot(u_xlat16_22.xyz, u_xlat16_22.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(u_xlat16_64);
    u_xlat16_22.x = dot(u_xlat4.xyz, u_xlat16_22.xyz);
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0);
    u_xlat16_22.x = log2(u_xlat16_22.x);
    u_xlat16_41 = _Shininess * 128.0;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_41;
    u_xlat16_22.x = exp2(u_xlat16_22.x);
    u_xlat16_22.x = min(u_xlat16_22.x, 1.0);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_6.x;
    u_xlat16_14.xyz = u_xlat16_22.xxx * unity_LightColor[0].xyz;
    u_xlat16_14.xyz = (bool(u_xlatb2)) ? u_xlat16_14.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_14.xyz = (bool(u_xlatb5)) ? u_xlat16_14.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_18.xyz = u_xlat1.xyz * vec3(u_xlat58) + (-u_xlat19.xyz);
    u_xlat16_22.x = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_22.x = inversesqrt(u_xlat16_22.x);
    u_xlat16_18.xyz = u_xlat16_22.xxx * u_xlat16_18.xyz;
    u_xlat16_22.x = dot(u_xlat4.xyz, u_xlat16_18.xyz);
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0);
    u_xlat16_22.x = log2(u_xlat16_22.x);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_41;
    u_xlat16_22.x = exp2(u_xlat16_22.x);
    u_xlat16_22.x = min(u_xlat16_22.x, 1.0);
    u_xlat16_3.x = u_xlat16_22.x * u_xlat16_3.x;
    u_xlat16_3.xyw = u_xlat16_3.xxx * unity_LightColor[1].xyz + u_xlat16_14.xyz;
    u_xlat16_3.xyw = (bool(u_xlatb0)) ? u_xlat16_3.xyw : u_xlat16_14.xyz;
    u_xlat16_3.xyw = (bool(u_xlatb43)) ? u_xlat16_3.xyw : u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat8.xyz * vec3(u_xlat62) + (-u_xlat19.xyz);
    u_xlat16_6.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_14.xyz = u_xlat16_6.xxx * u_xlat16_14.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_25.x;
    u_xlat16_14.xyz = u_xlat16_6.xxx * unity_LightColor[2].xyz + u_xlat16_3.xyw;
    u_xlat16_14.xyz = (bool(u_xlatb65)) ? u_xlat16_14.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb9)) ? u_xlat16_14.xyz : u_xlat16_3.xyw;
    u_xlat16_14.xyz = u_xlat28.xyz * vec3(u_xlat10) + (-u_xlat19.xyz);
    u_xlat16_6.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_14.xyz = u_xlat16_6.xxx * u_xlat16_14.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_44;
    u_xlat16_6.xyz = u_xlat16_6.xxx * unity_LightColor[3].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb29)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb48)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_6.xyz = u_xlat11.xyz * vec3(u_xlat67) + (-u_xlat19.xyz);
    u_xlat16_64 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat16_64);
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_6.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_63;
    u_xlat16_6.xyz = u_xlat16_6.xxx * unity_LightColor[4].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb68)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb12)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_6.xyz = u_xlat31.xyz * vec3(u_xlat13) + (-u_xlat19.xyz);
    u_xlat16_63 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_6.xyz = vec3(u_xlat16_63) * u_xlat16_6.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_6.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_7.x;
    u_xlat16_6.xyz = u_xlat16_6.xxx * unity_LightColor[5].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb32)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb51)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_6.xyz = u_xlat15.xyz * vec3(u_xlat70) + (-u_xlat19.xyz);
    u_xlat16_14.xyz = u_xlat35.xyz * vec3(u_xlat17) + (-u_xlat19.xyz);
    u_xlat16_63 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_6.xyz = vec3(u_xlat16_63) * u_xlat16_6.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_6.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_26.x;
    u_xlat16_6.xyz = u_xlat16_6.xxx * unity_LightColor[6].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb72)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb16)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_6.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_14.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_6.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_41 = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_41 = exp2(u_xlat16_41);
    u_xlat16_41 = min(u_xlat16_41, 1.0);
    u_xlat16_41 = u_xlat16_41 * u_xlat16_45;
    u_xlat16_6.xyz = vec3(u_xlat16_41) * unity_LightColor[7].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb36)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyz = (bool(u_xlatb24)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    vs_COLOR1.xyz = u_xlat16_3.xyz * _SpecColor.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR1.xyz = min(max(vs_COLOR1.xyz, 0.0), 1.0);
#else
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Illum;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_COLOR1;
in mediump float vs_TEXCOORD2;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat16_1.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_COLOR1;
out mediump float vs_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec3 u_xlat2;
bool u_xlatb2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
bool u_xlatb5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
bool u_xlatb9;
float u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
bool u_xlatb12;
float u_xlat13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
bool u_xlatb16;
float u_xlat17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
vec3 u_xlat21;
mediump vec3 u_xlat16_22;
int u_xlati24;
bool u_xlatb24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat28;
vec3 u_xlat29;
bool u_xlatb29;
vec3 u_xlat31;
vec3 u_xlat32;
bool u_xlatb32;
vec3 u_xlat35;
vec3 u_xlat36;
bool u_xlatb36;
mediump float u_xlat16_41;
bool u_xlatb43;
mediump float u_xlat16_44;
mediump float u_xlat16_45;
float u_xlat48;
bool u_xlatb48;
float u_xlat51;
bool u_xlatb51;
float u_xlat55;
bool u_xlatb55;
float u_xlat58;
float u_xlat61;
float u_xlat62;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
bool u_xlatb65;
float u_xlat67;
bool u_xlatb68;
float u_xlat70;
bool u_xlatb72;
float u_xlat74;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(unity_LightPosition[1].w!=0.0);
#else
    u_xlatb0 = unity_LightPosition[1].w!=0.0;
#endif
    u_xlat19.xyz = hlslcc_mtx4x4unity_ObjectToWorld[1].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat19.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].xxx + u_xlat19.xyz;
    u_xlat19.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].zzz + u_xlat19.xyz;
    u_xlat19.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[1].www + u_xlat19.xyz;
    u_xlat19.xyz = u_xlat19.xyz * in_POSITION0.yyy;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[0].www + u_xlat1.xyz;
    u_xlat19.xyz = u_xlat1.xyz * in_POSITION0.xxx + u_xlat19.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[2].www + u_xlat1.xyz;
    u_xlat19.xyz = u_xlat1.xyz * in_POSITION0.zzz + u_xlat19.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].zzz + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_MatrixV[3].xyz * hlslcc_mtx4x4unity_ObjectToWorld[3].www + u_xlat1.xyz;
    u_xlat19.xyz = u_xlat19.xyz + u_xlat1.xyz;
    u_xlat1.xyz = (-u_xlat19.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
    u_xlat58 = dot(u_xlat1.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightAtten[1].w<u_xlat58);
#else
    u_xlatb2 = unity_LightAtten[1].w<u_xlat58;
#endif
    u_xlatb0 = u_xlatb0 && u_xlatb2;
    u_xlat2.x = unity_LightAtten[1].z * u_xlat58 + 1.0;
    u_xlat58 = max(u_xlat58, 9.99999997e-07);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.5;
    u_xlat16_3.x = (u_xlatb0) ? 0.0 : u_xlat2.x;
    u_xlat2.xyz = vec3(u_xlat58) * u_xlat1.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].yyy;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].zzz + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[0].www + u_xlat4.xyz;
    u_xlat4.x = dot(u_xlat4.xyz, in_NORMAL0.xyz);
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[1].www + u_xlat5.xyz;
    u_xlat4.y = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[1].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].yyy;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[0].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].xxx + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[2].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].zzz + u_xlat5.xyz;
    u_xlat5.xyz = hlslcc_mtx4x4unity_WorldToObject[3].xyz * hlslcc_mtx4x4unity_MatrixInvV[2].www + u_xlat5.xyz;
    u_xlat4.z = dot(u_xlat5.xyz, in_NORMAL0.xyz);
    u_xlat0.x = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat16_22.x = dot(u_xlat4.xyz, u_xlat2.xyz);
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0);
    u_xlat16_6.xyz = u_xlat16_22.xxx * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<u_xlat16_22.x);
#else
    u_xlatb0 = 0.0<u_xlat16_22.x;
#endif
    u_xlat16_22.xyz = u_xlat16_6.xyz * unity_LightColor[1].xyz;
    u_xlat16_22.xyz = u_xlat16_3.xxx * u_xlat16_22.xyz;
    u_xlat16_22.xyz = min(u_xlat16_22.xyz, vec3(1.0, 1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(unity_LightPosition[0].w!=0.0);
#else
    u_xlatb2 = unity_LightPosition[0].w!=0.0;
#endif
    u_xlat21.xyz = (-u_xlat19.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
    u_xlat61 = dot(u_xlat21.xyz, u_xlat21.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(unity_LightAtten[0].w<u_xlat61);
#else
    u_xlatb5 = unity_LightAtten[0].w<u_xlat61;
#endif
    u_xlatb2 = u_xlatb2 && u_xlatb5;
    u_xlat5.x = unity_LightAtten[0].z * u_xlat61 + 1.0;
    u_xlat61 = max(u_xlat61, 9.99999997e-07);
    u_xlat61 = inversesqrt(u_xlat61);
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * 0.5;
    u_xlat16_6.x = (u_xlatb2) ? 0.0 : u_xlat5.x;
    u_xlat5.xyz = u_xlat21.xyz * vec3(u_xlat61);
    u_xlat16_25.x = dot(u_xlat4.xyz, u_xlat5.xyz);
    u_xlat16_25.x = max(u_xlat16_25.x, 0.0);
    u_xlat16_7.xyz = u_xlat16_25.xxx * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.0<u_xlat16_25.x);
#else
    u_xlatb2 = 0.0<u_xlat16_25.x;
#endif
    u_xlat16_25.xyz = u_xlat16_7.xyz * unity_LightColor[0].xyz;
    u_xlat16_25.xyz = u_xlat16_6.xxx * u_xlat16_25.xyz;
    u_xlat16_25.xyz = min(u_xlat16_25.xyz, vec3(1.0, 1.0, 1.0));
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb5 = 0<unity_VertexLightParams.x;
#endif
    u_xlat16_25.xyz = (bool(u_xlatb5)) ? u_xlat16_25.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_22.xyz = u_xlat16_22.xyz + u_xlat16_25.xyz;
    u_xlati24 = u_xlatb5 ? 1 : int(0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb43 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb43 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlati24 = (u_xlatb43) ? 2 : u_xlati24;
    u_xlat16_22.xyz = (bool(u_xlatb43)) ? u_xlat16_22.xyz : u_xlat16_25.xyz;
    u_xlat8.xyz = (-u_xlat19.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
    u_xlat62 = dot(u_xlat8.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(unity_LightAtten[2].w<u_xlat62);
#else
    u_xlatb65 = unity_LightAtten[2].w<u_xlat62;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(unity_LightPosition[2].w!=0.0);
#else
    u_xlatb9 = unity_LightPosition[2].w!=0.0;
#endif
    u_xlatb65 = u_xlatb65 && u_xlatb9;
    u_xlat9.x = unity_LightAtten[2].z * u_xlat62 + 1.0;
    u_xlat62 = max(u_xlat62, 9.99999997e-07);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat9.x = float(1.0) / u_xlat9.x;
    u_xlat9.x = u_xlat9.x * 0.5;
    u_xlat16_25.x = (u_xlatb65) ? 0.0 : u_xlat9.x;
    u_xlat9.xyz = vec3(u_xlat62) * u_xlat8.xyz;
    u_xlat16_44 = dot(u_xlat4.xyz, u_xlat9.xyz);
    u_xlat16_44 = max(u_xlat16_44, 0.0);
    u_xlat16_7.xyz = vec3(u_xlat16_44) * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb65 = !!(0.0<u_xlat16_44);
#else
    u_xlatb65 = 0.0<u_xlat16_44;
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * unity_LightColor[2].xyz;
    u_xlat16_7.xyz = u_xlat16_25.xxx * u_xlat16_7.xyz;
    u_xlat16_7.xyz = min(u_xlat16_7.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_7.xyz = u_xlat16_22.xyz + u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb9 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb9 = u_xlatb43 && u_xlatb9;
    u_xlat16_22.xyz = (bool(u_xlatb9)) ? u_xlat16_7.xyz : u_xlat16_22.xyz;
    u_xlat28.xyz = (-u_xlat19.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
    u_xlat10 = dot(u_xlat28.xyz, u_xlat28.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(unity_LightAtten[3].w<u_xlat10);
#else
    u_xlatb29 = unity_LightAtten[3].w<u_xlat10;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(unity_LightPosition[3].w!=0.0);
#else
    u_xlatb48 = unity_LightPosition[3].w!=0.0;
#endif
    u_xlatb29 = u_xlatb29 && u_xlatb48;
    u_xlat48 = unity_LightAtten[3].z * u_xlat10 + 1.0;
    u_xlat10 = max(u_xlat10, 9.99999997e-07);
    u_xlat10 = inversesqrt(u_xlat10);
    u_xlat48 = float(1.0) / u_xlat48;
    u_xlat48 = u_xlat48 * 0.5;
    u_xlat16_44 = (u_xlatb29) ? 0.0 : u_xlat48;
    u_xlat29.xyz = u_xlat28.xyz * vec3(u_xlat10);
    u_xlat16_63 = dot(u_xlat4.xyz, u_xlat29.xyz);
    u_xlat16_63 = max(u_xlat16_63, 0.0);
    u_xlat16_7.xyz = vec3(u_xlat16_63) * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(0.0<u_xlat16_63);
#else
    u_xlatb29 = 0.0<u_xlat16_63;
#endif
    u_xlat16_7.xyz = u_xlat16_7.xyz * unity_LightColor[3].xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_44) * u_xlat16_7.xyz;
    u_xlat16_7.xyz = min(u_xlat16_7.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_7.xyz = u_xlat16_22.xyz + u_xlat16_7.xyz;
    u_xlati24 = (u_xlatb9) ? 3 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb48 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb48 = u_xlatb9 && u_xlatb48;
    u_xlat16_22.xyz = (bool(u_xlatb48)) ? u_xlat16_7.xyz : u_xlat16_22.xyz;
    u_xlat11.xyz = (-u_xlat19.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
    u_xlat67 = dot(u_xlat11.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(unity_LightAtten[4].w<u_xlat67);
#else
    u_xlatb68 = unity_LightAtten[4].w<u_xlat67;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_LightPosition[4].w!=0.0);
#else
    u_xlatb12 = unity_LightPosition[4].w!=0.0;
#endif
    u_xlatb68 = u_xlatb68 && u_xlatb12;
    u_xlat12.x = unity_LightAtten[4].z * u_xlat67 + 1.0;
    u_xlat67 = max(u_xlat67, 9.99999997e-07);
    u_xlat67 = inversesqrt(u_xlat67);
    u_xlat12.x = float(1.0) / u_xlat12.x;
    u_xlat12.x = u_xlat12.x * 0.5;
    u_xlat16_63 = (u_xlatb68) ? 0.0 : u_xlat12.x;
    u_xlat12.xyz = vec3(u_xlat67) * u_xlat11.xyz;
    u_xlat16_7.x = dot(u_xlat4.xyz, u_xlat12.xyz);
    u_xlat16_7.x = max(u_xlat16_7.x, 0.0);
    u_xlat16_26.xyz = u_xlat16_7.xxx * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb68 = !!(0.0<u_xlat16_7.x);
#else
    u_xlatb68 = 0.0<u_xlat16_7.x;
#endif
    u_xlat16_7.xyz = u_xlat16_26.xyz * unity_LightColor[4].xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_63) * u_xlat16_7.xyz;
    u_xlat16_7.xyz = min(u_xlat16_7.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_7.xyz = u_xlat16_22.xyz + u_xlat16_7.xyz;
    u_xlati24 = (u_xlatb48) ? 4 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb12 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb12 = u_xlatb48 && u_xlatb12;
    u_xlat16_22.xyz = (bool(u_xlatb12)) ? u_xlat16_7.xyz : u_xlat16_22.xyz;
    u_xlat31.xyz = (-u_xlat19.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
    u_xlat13 = dot(u_xlat31.xyz, u_xlat31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(unity_LightAtten[5].w<u_xlat13);
#else
    u_xlatb32 = unity_LightAtten[5].w<u_xlat13;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(unity_LightPosition[5].w!=0.0);
#else
    u_xlatb51 = unity_LightPosition[5].w!=0.0;
#endif
    u_xlatb32 = u_xlatb32 && u_xlatb51;
    u_xlat51 = unity_LightAtten[5].z * u_xlat13 + 1.0;
    u_xlat13 = max(u_xlat13, 9.99999997e-07);
    u_xlat13 = inversesqrt(u_xlat13);
    u_xlat51 = float(1.0) / u_xlat51;
    u_xlat51 = u_xlat51 * 0.5;
    u_xlat16_7.x = (u_xlatb32) ? 0.0 : u_xlat51;
    u_xlat32.xyz = u_xlat31.xyz * vec3(u_xlat13);
    u_xlat16_26.x = dot(u_xlat4.xyz, u_xlat32.xyz);
    u_xlat16_26.x = max(u_xlat16_26.x, 0.0);
    u_xlat16_14.xyz = u_xlat16_26.xxx * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(0.0<u_xlat16_26.x);
#else
    u_xlatb32 = 0.0<u_xlat16_26.x;
#endif
    u_xlat16_26.xyz = u_xlat16_14.xyz * unity_LightColor[5].xyz;
    u_xlat16_26.xyz = u_xlat16_7.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = min(u_xlat16_26.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_26.xyz = u_xlat16_22.xyz + u_xlat16_26.xyz;
    u_xlati24 = (u_xlatb12) ? 5 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb51 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb51 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb51 = u_xlatb12 && u_xlatb51;
    u_xlat16_22.xyz = (bool(u_xlatb51)) ? u_xlat16_26.xyz : u_xlat16_22.xyz;
    u_xlat15.xyz = (-u_xlat19.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
    u_xlat70 = dot(u_xlat15.xyz, u_xlat15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(unity_LightAtten[6].w<u_xlat70);
#else
    u_xlatb72 = unity_LightAtten[6].w<u_xlat70;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(unity_LightPosition[6].w!=0.0);
#else
    u_xlatb16 = unity_LightPosition[6].w!=0.0;
#endif
    u_xlatb72 = u_xlatb72 && u_xlatb16;
    u_xlat16.x = unity_LightAtten[6].z * u_xlat70 + 1.0;
    u_xlat70 = max(u_xlat70, 9.99999997e-07);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat16.x = float(1.0) / u_xlat16.x;
    u_xlat16.x = u_xlat16.x * 0.5;
    u_xlat16_26.x = (u_xlatb72) ? 0.0 : u_xlat16.x;
    u_xlat16.xyz = vec3(u_xlat70) * u_xlat15.xyz;
    u_xlat16_45 = dot(u_xlat4.xyz, u_xlat16.xyz);
    u_xlat16_45 = max(u_xlat16_45, 0.0);
    u_xlat16_14.xyz = vec3(u_xlat16_45) * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(0.0<u_xlat16_45);
#else
    u_xlatb72 = 0.0<u_xlat16_45;
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz * unity_LightColor[6].xyz;
    u_xlat16_14.xyz = u_xlat16_26.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = min(u_xlat16_14.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_14.xyz = u_xlat16_22.xyz + u_xlat16_14.xyz;
    u_xlati24 = (u_xlatb51) ? 6 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb16 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb16 = u_xlatb51 && u_xlatb16;
    u_xlat16_22.xyz = (bool(u_xlatb16)) ? u_xlat16_14.xyz : u_xlat16_22.xyz;
    u_xlat35.xyz = (-u_xlat19.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
    u_xlat17 = dot(u_xlat35.xyz, u_xlat35.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(unity_LightAtten[7].w<u_xlat17);
#else
    u_xlatb36 = unity_LightAtten[7].w<u_xlat17;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(unity_LightPosition[7].w!=0.0);
#else
    u_xlatb55 = unity_LightPosition[7].w!=0.0;
#endif
    u_xlatb36 = u_xlatb36 && u_xlatb55;
    u_xlat55 = unity_LightAtten[7].z * u_xlat17 + 1.0;
    u_xlat17 = max(u_xlat17, 9.99999997e-07);
    u_xlat17 = inversesqrt(u_xlat17);
    u_xlat55 = float(1.0) / u_xlat55;
    u_xlat55 = u_xlat55 * 0.5;
    u_xlat16_45 = (u_xlatb36) ? 0.0 : u_xlat55;
    u_xlat36.xyz = u_xlat35.xyz * vec3(u_xlat17);
    u_xlat16_64 = dot(u_xlat4.xyz, u_xlat36.xyz);
    u_xlat16_64 = max(u_xlat16_64, 0.0);
    u_xlat16_14.xyz = vec3(u_xlat16_64) * _Color.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<u_xlat16_64);
#else
    u_xlatb36 = 0.0<u_xlat16_64;
#endif
    u_xlat16_14.xyz = u_xlat16_14.xyz * unity_LightColor[7].xyz;
    u_xlat16_14.xyz = vec3(u_xlat16_45) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = min(u_xlat16_14.xyz, vec3(1.0, 1.0, 1.0));
    u_xlat16_14.xyz = u_xlat16_22.xyz + u_xlat16_14.xyz;
    u_xlati24 = (u_xlatb16) ? 7 : u_xlati24;
#ifdef UNITY_ADRENO_ES3
    u_xlatb24 = !!(u_xlati24<unity_VertexLightParams.x);
#else
    u_xlatb24 = u_xlati24<unity_VertexLightParams.x;
#endif
    u_xlatb24 = u_xlatb24 && u_xlatb16;
    vs_COLOR0.xyz = (bool(u_xlatb24)) ? u_xlat16_14.xyz : u_xlat16_22.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    u_xlat55 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat74 = inversesqrt(u_xlat55);
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat55 * unity_FogParams.z + unity_FogParams.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    vs_TEXCOORD2 = u_xlat55;
    u_xlat19.xyz = u_xlat19.xyz * vec3(u_xlat74);
    u_xlat16_22.xyz = u_xlat21.xyz * vec3(u_xlat61) + (-u_xlat19.xyz);
    u_xlat16_64 = dot(u_xlat16_22.xyz, u_xlat16_22.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_22.xyz = u_xlat16_22.xyz * vec3(u_xlat16_64);
    u_xlat16_22.x = dot(u_xlat4.xyz, u_xlat16_22.xyz);
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0);
    u_xlat16_22.x = log2(u_xlat16_22.x);
    u_xlat16_41 = _Shininess * 128.0;
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_41;
    u_xlat16_22.x = exp2(u_xlat16_22.x);
    u_xlat16_22.x = min(u_xlat16_22.x, 1.0);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_6.x;
    u_xlat16_14.xyz = u_xlat16_22.xxx * unity_LightColor[0].xyz;
    u_xlat16_14.xyz = (bool(u_xlatb2)) ? u_xlat16_14.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_14.xyz = (bool(u_xlatb5)) ? u_xlat16_14.xyz : vec3(0.0, 0.0, 0.0);
    u_xlat16_18.xyz = u_xlat1.xyz * vec3(u_xlat58) + (-u_xlat19.xyz);
    u_xlat16_22.x = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_22.x = inversesqrt(u_xlat16_22.x);
    u_xlat16_18.xyz = u_xlat16_22.xxx * u_xlat16_18.xyz;
    u_xlat16_22.x = dot(u_xlat4.xyz, u_xlat16_18.xyz);
    u_xlat16_22.x = max(u_xlat16_22.x, 0.0);
    u_xlat16_22.x = log2(u_xlat16_22.x);
    u_xlat16_22.x = u_xlat16_22.x * u_xlat16_41;
    u_xlat16_22.x = exp2(u_xlat16_22.x);
    u_xlat16_22.x = min(u_xlat16_22.x, 1.0);
    u_xlat16_3.x = u_xlat16_22.x * u_xlat16_3.x;
    u_xlat16_3.xyw = u_xlat16_3.xxx * unity_LightColor[1].xyz + u_xlat16_14.xyz;
    u_xlat16_3.xyw = (bool(u_xlatb0)) ? u_xlat16_3.xyw : u_xlat16_14.xyz;
    u_xlat16_3.xyw = (bool(u_xlatb43)) ? u_xlat16_3.xyw : u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat8.xyz * vec3(u_xlat62) + (-u_xlat19.xyz);
    u_xlat16_6.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_14.xyz = u_xlat16_6.xxx * u_xlat16_14.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_25.x;
    u_xlat16_14.xyz = u_xlat16_6.xxx * unity_LightColor[2].xyz + u_xlat16_3.xyw;
    u_xlat16_14.xyz = (bool(u_xlatb65)) ? u_xlat16_14.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb9)) ? u_xlat16_14.xyz : u_xlat16_3.xyw;
    u_xlat16_14.xyz = u_xlat28.xyz * vec3(u_xlat10) + (-u_xlat19.xyz);
    u_xlat16_6.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_14.xyz = u_xlat16_6.xxx * u_xlat16_14.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_44;
    u_xlat16_6.xyz = u_xlat16_6.xxx * unity_LightColor[3].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb29)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb48)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_6.xyz = u_xlat11.xyz * vec3(u_xlat67) + (-u_xlat19.xyz);
    u_xlat16_64 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(u_xlat16_64);
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_6.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_63;
    u_xlat16_6.xyz = u_xlat16_6.xxx * unity_LightColor[4].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb68)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb12)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_6.xyz = u_xlat31.xyz * vec3(u_xlat13) + (-u_xlat19.xyz);
    u_xlat16_63 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_6.xyz = vec3(u_xlat16_63) * u_xlat16_6.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_6.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_7.x;
    u_xlat16_6.xyz = u_xlat16_6.xxx * unity_LightColor[5].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb32)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb51)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_6.xyz = u_xlat15.xyz * vec3(u_xlat70) + (-u_xlat19.xyz);
    u_xlat16_14.xyz = u_xlat35.xyz * vec3(u_xlat17) + (-u_xlat19.xyz);
    u_xlat16_63 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_6.xyz = vec3(u_xlat16_63) * u_xlat16_6.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_6.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_6.x = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_6.x = exp2(u_xlat16_6.x);
    u_xlat16_6.x = min(u_xlat16_6.x, 1.0);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_26.x;
    u_xlat16_6.xyz = u_xlat16_6.xxx * unity_LightColor[6].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb72)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyw = (bool(u_xlatb16)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_6.x = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_6.x = inversesqrt(u_xlat16_6.x);
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_14.xyz;
    u_xlat16_6.x = dot(u_xlat4.xyz, u_xlat16_6.xyz);
    u_xlat16_6.x = max(u_xlat16_6.x, 0.0);
    u_xlat16_6.x = log2(u_xlat16_6.x);
    u_xlat16_41 = u_xlat16_41 * u_xlat16_6.x;
    u_xlat16_41 = exp2(u_xlat16_41);
    u_xlat16_41 = min(u_xlat16_41, 1.0);
    u_xlat16_41 = u_xlat16_41 * u_xlat16_45;
    u_xlat16_6.xyz = vec3(u_xlat16_41) * unity_LightColor[7].xyz + u_xlat16_3.xyw;
    u_xlat16_6.xyz = (bool(u_xlatb36)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    u_xlat16_3.xyz = (bool(u_xlatb24)) ? u_xlat16_6.xyz : u_xlat16_3.xyw;
    vs_COLOR1.xyz = u_xlat16_3.xyz * _SpecColor.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR1.xyz = min(max(vs_COLOR1.xyz, 0.0), 1.0);
#else
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
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
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Illum;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_COLOR1;
in mediump float vs_TEXCOORD2;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat16_1.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying mediump float vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
int u_xlati2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat13;
bool u_xlatb13;
float u_xlat14;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_20;
bool u_xlatb25;
float u_xlat33;
float u_xlat34;
bool u_xlatb36;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat33);
    u_xlat16_7 = _Shininess * 128.0;
    u_xlat16_18.x = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat16_18.z = float(0.0);
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat13.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat3.x = dot(u_xlat13.xyz, u_xlat13.xyz);
        u_xlat14 = unity_LightAtten[u_xlati_loop_1].z * u_xlat3.x + 1.0;
        u_xlat14 = float(1.0) / u_xlat14;
        u_xlatb25 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb36 = unity_LightAtten[u_xlati_loop_1].w<u_xlat3.x;
        u_xlatb25 = u_xlatb36 && u_xlatb25;
        u_xlat16_41 = (u_xlatb25) ? 0.0 : u_xlat14;
        u_xlat3.x = max(u_xlat3.x, 9.99999997e-07);
        u_xlat3.x = inversesqrt(u_xlat3.x);
        u_xlat13.xyz = u_xlat13.xyz * u_xlat3.xxx;
        u_xlat3.x = dot(u_xlat13.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat3.x = max(u_xlat3.x, 0.0);
        u_xlat16_9.x = u_xlat3.x + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16_9.x = u_xlat16_9.x * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
        u_xlat16_41 = u_xlat16_41 * u_xlat16_9.x;
        u_xlat16_41 = u_xlat16_41 * 0.5;
        u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat13.xyz);
        u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
        u_xlat16_20.xyz = u_xlat16_9.xxx * _Color.xyz;
        u_xlat16_20.xyz = u_xlat16_20.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb3 = 0.0<u_xlat16_9.x;
        if(u_xlatb3){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat34) + u_xlat13.xyz;
            u_xlat16_9.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
            u_xlat16_10.xyz = u_xlat16_9.xxx * u_xlat16_10.xyz;
            u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
            u_xlat16_9.x = log2(u_xlat16_9.x);
            u_xlat16_9.x = u_xlat16_7 * u_xlat16_9.x;
            u_xlat16_9.x = exp2(u_xlat16_9.x);
            u_xlat16_9.x = min(u_xlat16_9.x, 1.0);
            u_xlat16_9.x = u_xlat16_41 * u_xlat16_9.x;
            u_xlat16_8.xyz = u_xlat16_9.xxx * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        }
        u_xlat16_9.xyz = vec3(u_xlat16_41) * u_xlat16_20.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat16_18.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = sqrt(u_xlat33);
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
    vs_TEXCOORD2 = u_xlat0.x;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Illum;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying mediump float vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0.x = texture2D(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat10_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat16_1.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying mediump float vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
int u_xlati2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat13;
bool u_xlatb13;
float u_xlat14;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_20;
bool u_xlatb25;
float u_xlat33;
float u_xlat34;
bool u_xlatb36;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat33);
    u_xlat16_7 = _Shininess * 128.0;
    u_xlat16_18.x = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat16_18.z = float(0.0);
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat13.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat3.x = dot(u_xlat13.xyz, u_xlat13.xyz);
        u_xlat14 = unity_LightAtten[u_xlati_loop_1].z * u_xlat3.x + 1.0;
        u_xlat14 = float(1.0) / u_xlat14;
        u_xlatb25 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb36 = unity_LightAtten[u_xlati_loop_1].w<u_xlat3.x;
        u_xlatb25 = u_xlatb36 && u_xlatb25;
        u_xlat16_41 = (u_xlatb25) ? 0.0 : u_xlat14;
        u_xlat3.x = max(u_xlat3.x, 9.99999997e-07);
        u_xlat3.x = inversesqrt(u_xlat3.x);
        u_xlat13.xyz = u_xlat13.xyz * u_xlat3.xxx;
        u_xlat3.x = dot(u_xlat13.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat3.x = max(u_xlat3.x, 0.0);
        u_xlat16_9.x = u_xlat3.x + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16_9.x = u_xlat16_9.x * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
        u_xlat16_41 = u_xlat16_41 * u_xlat16_9.x;
        u_xlat16_41 = u_xlat16_41 * 0.5;
        u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat13.xyz);
        u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
        u_xlat16_20.xyz = u_xlat16_9.xxx * _Color.xyz;
        u_xlat16_20.xyz = u_xlat16_20.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb3 = 0.0<u_xlat16_9.x;
        if(u_xlatb3){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat34) + u_xlat13.xyz;
            u_xlat16_9.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
            u_xlat16_10.xyz = u_xlat16_9.xxx * u_xlat16_10.xyz;
            u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
            u_xlat16_9.x = log2(u_xlat16_9.x);
            u_xlat16_9.x = u_xlat16_7 * u_xlat16_9.x;
            u_xlat16_9.x = exp2(u_xlat16_9.x);
            u_xlat16_9.x = min(u_xlat16_9.x, 1.0);
            u_xlat16_9.x = u_xlat16_41 * u_xlat16_9.x;
            u_xlat16_8.xyz = u_xlat16_9.xxx * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        }
        u_xlat16_9.xyz = vec3(u_xlat16_41) * u_xlat16_20.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat16_18.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = sqrt(u_xlat33);
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
    vs_TEXCOORD2 = u_xlat0.x;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Illum;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying mediump float vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0.x = texture2D(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat10_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat16_1.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
attribute highp vec3 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec3 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying mediump float vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
int u_xlati2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat13;
bool u_xlatb13;
float u_xlat14;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_20;
bool u_xlatb25;
float u_xlat33;
float u_xlat34;
bool u_xlatb36;
mediump float u_xlat16_41;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat33);
    u_xlat16_7 = _Shininess * 128.0;
    u_xlat16_18.x = float(0.0);
    u_xlat16_18.y = float(0.0);
    u_xlat16_18.z = float(0.0);
    u_xlat16_8.x = float(0.0);
    u_xlat16_8.y = float(0.0);
    u_xlat16_8.z = float(0.0);
    for(int u_xlati_loop_1 = 0 ; u_xlati_loop_1<8 ; u_xlati_loop_1++)
    {
        u_xlat13.xyz = (-u_xlat0.xyz) * unity_LightPosition[u_xlati_loop_1].www + unity_LightPosition[u_xlati_loop_1].xyz;
        u_xlat3.x = dot(u_xlat13.xyz, u_xlat13.xyz);
        u_xlat14 = unity_LightAtten[u_xlati_loop_1].z * u_xlat3.x + 1.0;
        u_xlat14 = float(1.0) / u_xlat14;
        u_xlatb25 = 0.0!=unity_LightPosition[u_xlati_loop_1].w;
        u_xlatb36 = unity_LightAtten[u_xlati_loop_1].w<u_xlat3.x;
        u_xlatb25 = u_xlatb36 && u_xlatb25;
        u_xlat16_41 = (u_xlatb25) ? 0.0 : u_xlat14;
        u_xlat3.x = max(u_xlat3.x, 9.99999997e-07);
        u_xlat3.x = inversesqrt(u_xlat3.x);
        u_xlat13.xyz = u_xlat13.xyz * u_xlat3.xxx;
        u_xlat3.x = dot(u_xlat13.xyz, unity_SpotDirection[u_xlati_loop_1].xyz);
        u_xlat3.x = max(u_xlat3.x, 0.0);
        u_xlat16_9.x = u_xlat3.x + (-unity_LightAtten[u_xlati_loop_1].x);
        u_xlat16_9.x = u_xlat16_9.x * unity_LightAtten[u_xlati_loop_1].y;
        u_xlat16_9.x = clamp(u_xlat16_9.x, 0.0, 1.0);
        u_xlat16_41 = u_xlat16_41 * u_xlat16_9.x;
        u_xlat16_41 = u_xlat16_41 * 0.5;
        u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat13.xyz);
        u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
        u_xlat16_20.xyz = u_xlat16_9.xxx * _Color.xyz;
        u_xlat16_20.xyz = u_xlat16_20.xyz * unity_LightColor[u_xlati_loop_1].xyz;
        u_xlatb3 = 0.0<u_xlat16_9.x;
        if(u_xlatb3){
            u_xlat16_10.xyz = (-u_xlat0.xyz) * vec3(u_xlat34) + u_xlat13.xyz;
            u_xlat16_9.x = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = inversesqrt(u_xlat16_9.x);
            u_xlat16_10.xyz = u_xlat16_9.xxx * u_xlat16_10.xyz;
            u_xlat16_9.x = dot(u_xlat1.xyz, u_xlat16_10.xyz);
            u_xlat16_9.x = max(u_xlat16_9.x, 0.0);
            u_xlat16_9.x = log2(u_xlat16_9.x);
            u_xlat16_9.x = u_xlat16_7 * u_xlat16_9.x;
            u_xlat16_9.x = exp2(u_xlat16_9.x);
            u_xlat16_9.x = min(u_xlat16_9.x, 1.0);
            u_xlat16_9.x = u_xlat16_41 * u_xlat16_9.x;
            u_xlat16_8.xyz = u_xlat16_9.xxx * unity_LightColor[u_xlati_loop_1].xyz + u_xlat16_8.xyz;
        }
        u_xlat16_9.xyz = vec3(u_xlat16_41) * u_xlat16_20.xyz;
        u_xlat16_9.xyz = min(u_xlat16_9.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_9.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_8.xyz * _SpecColor.xyz;
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
    vs_COLOR0.xyz = u_xlat16_18.xyz;
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
    vs_COLOR0.w = _Color.w;
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = sqrt(u_xlat33);
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
    vs_TEXCOORD2 = u_xlat0.x;
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
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Illum;
uniform lowp sampler2D _MainTex;
varying mediump vec4 vs_COLOR0;
varying mediump vec3 vs_COLOR1;
varying mediump float vs_TEXCOORD2;
varying highp vec2 vs_TEXCOORD0;
varying highp vec2 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
lowp vec3 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0.x = texture2D(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat10_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat10_0.xyz = texture2D(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat16_1.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_COLOR1;
out mediump float vs_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
bool u_xlatb14;
bool u_xlatb15;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
bool u_xlatb26;
mediump float u_xlat16_29;
float u_xlat33;
float u_xlat34;
int u_xlati34;
bool u_xlatb34;
float u_xlat35;
bool u_xlatb35;
float u_xlat36;
bool u_xlatb36;
float u_xlat37;
mediump float u_xlat16_42;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat33);
    u_xlat2.xyz = u_xlat0.xyz * vec3(u_xlat34);
    u_xlat16_7 = _Shininess * 128.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb34 = 0<unity_VertexLightParams.x;
#endif
    if(u_xlatb34){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
        u_xlat34 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat35 = unity_LightAtten[0].z * u_xlat34 + 1.0;
        u_xlat35 = float(1.0) / u_xlat35;
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(unity_LightPosition[0].w!=0.0);
#else
        u_xlatb36 = unity_LightPosition[0].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(unity_LightAtten[0].w<u_xlat34);
#else
        u_xlatb4 = unity_LightAtten[0].w<u_xlat34;
#endif
        u_xlatb36 = u_xlatb36 && u_xlatb4;
        u_xlat16_18.x = (u_xlatb36) ? 0.0 : u_xlat35;
        u_xlat34 = max(u_xlat34, 9.99999997e-07);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat4.xyz = vec3(u_xlat34) * u_xlat3.xyz;
        u_xlat35 = dot(u_xlat4.xyz, unity_SpotDirection[0].xyz);
        u_xlat35 = max(u_xlat35, 0.0);
        u_xlat16_29 = u_xlat35 + (-unity_LightAtten[0].x);
        u_xlat16_29 = u_xlat16_29 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_29 = min(max(u_xlat16_29, 0.0), 1.0);
#else
        u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
#endif
        u_xlat16_18.x = u_xlat16_29 * u_xlat16_18.x;
        u_xlat16_18.x = u_xlat16_18.x * 0.5;
        u_xlat16_29 = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_29 = max(u_xlat16_29, 0.0);
        u_xlat16_8.xyz = vec3(u_xlat16_29) * _Color.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xyz * unity_LightColor[0].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb35 = !!(0.0<u_xlat16_29);
#else
        u_xlatb35 = 0.0<u_xlat16_29;
#endif
        u_xlat16_9.xyz = u_xlat3.xyz * vec3(u_xlat34) + (-u_xlat2.xyz);
        u_xlat16_29 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
        u_xlat16_29 = inversesqrt(u_xlat16_29);
        u_xlat16_9.xyz = vec3(u_xlat16_29) * u_xlat16_9.xyz;
        u_xlat16_29 = dot(u_xlat1.xyz, u_xlat16_9.xyz);
        u_xlat16_29 = max(u_xlat16_29, 0.0);
        u_xlat16_29 = log2(u_xlat16_29);
        u_xlat16_29 = u_xlat16_29 * u_xlat16_7;
        u_xlat16_29 = exp2(u_xlat16_29);
        u_xlat16_29 = min(u_xlat16_29, 1.0);
        u_xlat16_29 = u_xlat16_29 * u_xlat16_18.x;
        u_xlat16_9.xyz = vec3(u_xlat16_29) * unity_LightColor[0].xyz;
        u_xlat16_9.xyz = (bool(u_xlatb35)) ? u_xlat16_9.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat16_18.xyz = u_xlat16_18.xxx * u_xlat16_8.xyz;
        u_xlat16_18.xyz = min(u_xlat16_18.xyz, vec3(1.0, 1.0, 1.0));
        u_xlati34 = 1;
    } else {
        u_xlat16_18.x = float(0.0);
        u_xlat16_18.y = float(0.0);
        u_xlat16_18.z = float(0.0);
        u_xlat16_9.x = float(0.0);
        u_xlat16_9.y = float(0.0);
        u_xlat16_9.z = float(0.0);
        u_xlati34 = 0;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(u_xlati34<unity_VertexLightParams.x);
#else
    u_xlatb35 = u_xlati34<unity_VertexLightParams.x;
#endif
    if(u_xlatb35){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
        u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat4.x = unity_LightAtten[1].z * u_xlat36 + 1.0;
        u_xlat4.x = float(1.0) / u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightPosition[1].w!=0.0);
#else
        u_xlatb15 = unity_LightPosition[1].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb26 = !!(unity_LightAtten[1].w<u_xlat36);
#else
        u_xlatb26 = unity_LightAtten[1].w<u_xlat36;
#endif
        u_xlatb15 = u_xlatb26 && u_xlatb15;
        u_xlat16_8.x = (u_xlatb15) ? 0.0 : u_xlat4.x;
        u_xlat36 = max(u_xlat36, 9.99999997e-07);
        u_xlat36 = inversesqrt(u_xlat36);
        u_xlat4.xyz = vec3(u_xlat36) * u_xlat3.xyz;
        u_xlat37 = dot(u_xlat4.xyz, unity_SpotDirection[1].xyz);
        u_xlat37 = max(u_xlat37, 0.0);
        u_xlat16_19.x = u_xlat37 + (-unity_LightAtten[1].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb4 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat36) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[1].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb4)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati34 = 2;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlati34<unity_VertexLightParams.x);
#else
    u_xlatb3 = u_xlati34<unity_VertexLightParams.x;
#endif
    u_xlatb35 = u_xlatb35 && u_xlatb3;
    if(u_xlatb35){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
        u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat4.x = unity_LightAtten[2].z * u_xlat36 + 1.0;
        u_xlat4.x = float(1.0) / u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightPosition[2].w!=0.0);
#else
        u_xlatb15 = unity_LightPosition[2].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb26 = !!(unity_LightAtten[2].w<u_xlat36);
#else
        u_xlatb26 = unity_LightAtten[2].w<u_xlat36;
#endif
        u_xlatb15 = u_xlatb26 && u_xlatb15;
        u_xlat16_8.x = (u_xlatb15) ? 0.0 : u_xlat4.x;
        u_xlat36 = max(u_xlat36, 9.99999997e-07);
        u_xlat36 = inversesqrt(u_xlat36);
        u_xlat4.xyz = vec3(u_xlat36) * u_xlat3.xyz;
        u_xlat37 = dot(u_xlat4.xyz, unity_SpotDirection[2].xyz);
        u_xlat37 = max(u_xlat37, 0.0);
        u_xlat16_19.x = u_xlat37 + (-unity_LightAtten[2].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[2].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb4 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat36) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[2].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb4)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati34 = 3;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlati34<unity_VertexLightParams.x);
#else
    u_xlatb3 = u_xlati34<unity_VertexLightParams.x;
#endif
    u_xlatb35 = u_xlatb35 && u_xlatb3;
    if(u_xlatb35){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
        u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat4.x = unity_LightAtten[3].z * u_xlat36 + 1.0;
        u_xlat4.x = float(1.0) / u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightPosition[3].w!=0.0);
#else
        u_xlatb15 = unity_LightPosition[3].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb26 = !!(unity_LightAtten[3].w<u_xlat36);
#else
        u_xlatb26 = unity_LightAtten[3].w<u_xlat36;
#endif
        u_xlatb15 = u_xlatb26 && u_xlatb15;
        u_xlat16_8.x = (u_xlatb15) ? 0.0 : u_xlat4.x;
        u_xlat36 = max(u_xlat36, 9.99999997e-07);
        u_xlat36 = inversesqrt(u_xlat36);
        u_xlat4.xyz = vec3(u_xlat36) * u_xlat3.xyz;
        u_xlat37 = dot(u_xlat4.xyz, unity_SpotDirection[3].xyz);
        u_xlat37 = max(u_xlat37, 0.0);
        u_xlat16_19.x = u_xlat37 + (-unity_LightAtten[3].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb4 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat36) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[3].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb4)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati34 = 4;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlati34<unity_VertexLightParams.x);
#else
    u_xlatb3 = u_xlati34<unity_VertexLightParams.x;
#endif
    u_xlatb35 = u_xlatb35 && u_xlatb3;
    if(u_xlatb35){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
        u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat4.x = unity_LightAtten[4].z * u_xlat36 + 1.0;
        u_xlat4.x = float(1.0) / u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightPosition[4].w!=0.0);
#else
        u_xlatb15 = unity_LightPosition[4].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb26 = !!(unity_LightAtten[4].w<u_xlat36);
#else
        u_xlatb26 = unity_LightAtten[4].w<u_xlat36;
#endif
        u_xlatb15 = u_xlatb26 && u_xlatb15;
        u_xlat16_8.x = (u_xlatb15) ? 0.0 : u_xlat4.x;
        u_xlat36 = max(u_xlat36, 9.99999997e-07);
        u_xlat36 = inversesqrt(u_xlat36);
        u_xlat4.xyz = vec3(u_xlat36) * u_xlat3.xyz;
        u_xlat37 = dot(u_xlat4.xyz, unity_SpotDirection[4].xyz);
        u_xlat37 = max(u_xlat37, 0.0);
        u_xlat16_19.x = u_xlat37 + (-unity_LightAtten[4].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb4 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat36) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[4].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb4)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati34 = 5;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlati34<unity_VertexLightParams.x);
#else
    u_xlatb3 = u_xlati34<unity_VertexLightParams.x;
#endif
    u_xlatb35 = u_xlatb35 && u_xlatb3;
    if(u_xlatb35){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
        u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat4.x = unity_LightAtten[5].z * u_xlat36 + 1.0;
        u_xlat4.x = float(1.0) / u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightPosition[5].w!=0.0);
#else
        u_xlatb15 = unity_LightPosition[5].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb26 = !!(unity_LightAtten[5].w<u_xlat36);
#else
        u_xlatb26 = unity_LightAtten[5].w<u_xlat36;
#endif
        u_xlatb15 = u_xlatb26 && u_xlatb15;
        u_xlat16_8.x = (u_xlatb15) ? 0.0 : u_xlat4.x;
        u_xlat36 = max(u_xlat36, 9.99999997e-07);
        u_xlat36 = inversesqrt(u_xlat36);
        u_xlat4.xyz = vec3(u_xlat36) * u_xlat3.xyz;
        u_xlat37 = dot(u_xlat4.xyz, unity_SpotDirection[5].xyz);
        u_xlat37 = max(u_xlat37, 0.0);
        u_xlat16_19.x = u_xlat37 + (-unity_LightAtten[5].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb4 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat36) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[5].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb4)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati34 = 6;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlati34<unity_VertexLightParams.x);
#else
    u_xlatb3 = u_xlati34<unity_VertexLightParams.x;
#endif
    u_xlatb35 = u_xlatb35 && u_xlatb3;
    if(u_xlatb35){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
        u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat4.x = unity_LightAtten[6].z * u_xlat36 + 1.0;
        u_xlat4.x = float(1.0) / u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightPosition[6].w!=0.0);
#else
        u_xlatb15 = unity_LightPosition[6].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb26 = !!(unity_LightAtten[6].w<u_xlat36);
#else
        u_xlatb26 = unity_LightAtten[6].w<u_xlat36;
#endif
        u_xlatb15 = u_xlatb26 && u_xlatb15;
        u_xlat16_8.x = (u_xlatb15) ? 0.0 : u_xlat4.x;
        u_xlat36 = max(u_xlat36, 9.99999997e-07);
        u_xlat36 = inversesqrt(u_xlat36);
        u_xlat4.xyz = vec3(u_xlat36) * u_xlat3.xyz;
        u_xlat37 = dot(u_xlat4.xyz, unity_SpotDirection[6].xyz);
        u_xlat37 = max(u_xlat37, 0.0);
        u_xlat16_19.x = u_xlat37 + (-unity_LightAtten[6].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb4 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat36) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[6].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb4)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati34 = 7;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(u_xlati34<unity_VertexLightParams.x);
#else
    u_xlatb34 = u_xlati34<unity_VertexLightParams.x;
#endif
    u_xlatb34 = u_xlatb34 && u_xlatb35;
    if(u_xlatb34){
        u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
        u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = unity_LightAtten[7].z * u_xlat34 + 1.0;
        u_xlat35 = float(1.0) / u_xlat35;
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(unity_LightPosition[7].w!=0.0);
#else
        u_xlatb3 = unity_LightPosition[7].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb14 = !!(unity_LightAtten[7].w<u_xlat34);
#else
        u_xlatb14 = unity_LightAtten[7].w<u_xlat34;
#endif
        u_xlatb3 = u_xlatb14 && u_xlatb3;
        u_xlat16_8.x = (u_xlatb3) ? 0.0 : u_xlat35;
        u_xlat34 = max(u_xlat34, 9.99999997e-07);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat34);
        u_xlat35 = dot(u_xlat3.xyz, unity_SpotDirection[7].xyz);
        u_xlat35 = max(u_xlat35, 0.0);
        u_xlat16_19.x = u_xlat35 + (-unity_LightAtten[7].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat3.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb35 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb35 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat0.xyz * vec3(u_xlat34) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_7 = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_7 = exp2(u_xlat16_7);
        u_xlat16_7 = min(u_xlat16_7, 1.0);
        u_xlat16_7 = u_xlat16_7 * u_xlat16_8.x;
        u_xlat16_19.xyz = vec3(u_xlat16_7) * unity_LightColor[7].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb35)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_9.xyz * _SpecColor.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR1.xyz = min(max(vs_COLOR1.xyz, 0.0), 1.0);
#else
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.xyz = u_xlat16_18.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = sqrt(u_xlat33);
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
    vs_TEXCOORD2 = u_xlat0.x;
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
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Illum;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_COLOR1;
in mediump float vs_TEXCOORD2;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat16_1.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_COLOR1;
out mediump float vs_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
bool u_xlatb14;
bool u_xlatb15;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
bool u_xlatb26;
mediump float u_xlat16_29;
float u_xlat33;
float u_xlat34;
int u_xlati34;
bool u_xlatb34;
float u_xlat35;
bool u_xlatb35;
float u_xlat36;
bool u_xlatb36;
float u_xlat37;
mediump float u_xlat16_42;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat33);
    u_xlat2.xyz = u_xlat0.xyz * vec3(u_xlat34);
    u_xlat16_7 = _Shininess * 128.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb34 = 0<unity_VertexLightParams.x;
#endif
    if(u_xlatb34){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
        u_xlat34 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat35 = unity_LightAtten[0].z * u_xlat34 + 1.0;
        u_xlat35 = float(1.0) / u_xlat35;
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(unity_LightPosition[0].w!=0.0);
#else
        u_xlatb36 = unity_LightPosition[0].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(unity_LightAtten[0].w<u_xlat34);
#else
        u_xlatb4 = unity_LightAtten[0].w<u_xlat34;
#endif
        u_xlatb36 = u_xlatb36 && u_xlatb4;
        u_xlat16_18.x = (u_xlatb36) ? 0.0 : u_xlat35;
        u_xlat34 = max(u_xlat34, 9.99999997e-07);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat4.xyz = vec3(u_xlat34) * u_xlat3.xyz;
        u_xlat35 = dot(u_xlat4.xyz, unity_SpotDirection[0].xyz);
        u_xlat35 = max(u_xlat35, 0.0);
        u_xlat16_29 = u_xlat35 + (-unity_LightAtten[0].x);
        u_xlat16_29 = u_xlat16_29 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_29 = min(max(u_xlat16_29, 0.0), 1.0);
#else
        u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
#endif
        u_xlat16_18.x = u_xlat16_29 * u_xlat16_18.x;
        u_xlat16_18.x = u_xlat16_18.x * 0.5;
        u_xlat16_29 = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_29 = max(u_xlat16_29, 0.0);
        u_xlat16_8.xyz = vec3(u_xlat16_29) * _Color.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xyz * unity_LightColor[0].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb35 = !!(0.0<u_xlat16_29);
#else
        u_xlatb35 = 0.0<u_xlat16_29;
#endif
        u_xlat16_9.xyz = u_xlat3.xyz * vec3(u_xlat34) + (-u_xlat2.xyz);
        u_xlat16_29 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
        u_xlat16_29 = inversesqrt(u_xlat16_29);
        u_xlat16_9.xyz = vec3(u_xlat16_29) * u_xlat16_9.xyz;
        u_xlat16_29 = dot(u_xlat1.xyz, u_xlat16_9.xyz);
        u_xlat16_29 = max(u_xlat16_29, 0.0);
        u_xlat16_29 = log2(u_xlat16_29);
        u_xlat16_29 = u_xlat16_29 * u_xlat16_7;
        u_xlat16_29 = exp2(u_xlat16_29);
        u_xlat16_29 = min(u_xlat16_29, 1.0);
        u_xlat16_29 = u_xlat16_29 * u_xlat16_18.x;
        u_xlat16_9.xyz = vec3(u_xlat16_29) * unity_LightColor[0].xyz;
        u_xlat16_9.xyz = (bool(u_xlatb35)) ? u_xlat16_9.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat16_18.xyz = u_xlat16_18.xxx * u_xlat16_8.xyz;
        u_xlat16_18.xyz = min(u_xlat16_18.xyz, vec3(1.0, 1.0, 1.0));
        u_xlati34 = 1;
    } else {
        u_xlat16_18.x = float(0.0);
        u_xlat16_18.y = float(0.0);
        u_xlat16_18.z = float(0.0);
        u_xlat16_9.x = float(0.0);
        u_xlat16_9.y = float(0.0);
        u_xlat16_9.z = float(0.0);
        u_xlati34 = 0;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(u_xlati34<unity_VertexLightParams.x);
#else
    u_xlatb35 = u_xlati34<unity_VertexLightParams.x;
#endif
    if(u_xlatb35){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
        u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat4.x = unity_LightAtten[1].z * u_xlat36 + 1.0;
        u_xlat4.x = float(1.0) / u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightPosition[1].w!=0.0);
#else
        u_xlatb15 = unity_LightPosition[1].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb26 = !!(unity_LightAtten[1].w<u_xlat36);
#else
        u_xlatb26 = unity_LightAtten[1].w<u_xlat36;
#endif
        u_xlatb15 = u_xlatb26 && u_xlatb15;
        u_xlat16_8.x = (u_xlatb15) ? 0.0 : u_xlat4.x;
        u_xlat36 = max(u_xlat36, 9.99999997e-07);
        u_xlat36 = inversesqrt(u_xlat36);
        u_xlat4.xyz = vec3(u_xlat36) * u_xlat3.xyz;
        u_xlat37 = dot(u_xlat4.xyz, unity_SpotDirection[1].xyz);
        u_xlat37 = max(u_xlat37, 0.0);
        u_xlat16_19.x = u_xlat37 + (-unity_LightAtten[1].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb4 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat36) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[1].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb4)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati34 = 2;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlati34<unity_VertexLightParams.x);
#else
    u_xlatb3 = u_xlati34<unity_VertexLightParams.x;
#endif
    u_xlatb35 = u_xlatb35 && u_xlatb3;
    if(u_xlatb35){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
        u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat4.x = unity_LightAtten[2].z * u_xlat36 + 1.0;
        u_xlat4.x = float(1.0) / u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightPosition[2].w!=0.0);
#else
        u_xlatb15 = unity_LightPosition[2].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb26 = !!(unity_LightAtten[2].w<u_xlat36);
#else
        u_xlatb26 = unity_LightAtten[2].w<u_xlat36;
#endif
        u_xlatb15 = u_xlatb26 && u_xlatb15;
        u_xlat16_8.x = (u_xlatb15) ? 0.0 : u_xlat4.x;
        u_xlat36 = max(u_xlat36, 9.99999997e-07);
        u_xlat36 = inversesqrt(u_xlat36);
        u_xlat4.xyz = vec3(u_xlat36) * u_xlat3.xyz;
        u_xlat37 = dot(u_xlat4.xyz, unity_SpotDirection[2].xyz);
        u_xlat37 = max(u_xlat37, 0.0);
        u_xlat16_19.x = u_xlat37 + (-unity_LightAtten[2].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[2].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb4 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat36) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[2].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb4)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati34 = 3;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlati34<unity_VertexLightParams.x);
#else
    u_xlatb3 = u_xlati34<unity_VertexLightParams.x;
#endif
    u_xlatb35 = u_xlatb35 && u_xlatb3;
    if(u_xlatb35){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
        u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat4.x = unity_LightAtten[3].z * u_xlat36 + 1.0;
        u_xlat4.x = float(1.0) / u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightPosition[3].w!=0.0);
#else
        u_xlatb15 = unity_LightPosition[3].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb26 = !!(unity_LightAtten[3].w<u_xlat36);
#else
        u_xlatb26 = unity_LightAtten[3].w<u_xlat36;
#endif
        u_xlatb15 = u_xlatb26 && u_xlatb15;
        u_xlat16_8.x = (u_xlatb15) ? 0.0 : u_xlat4.x;
        u_xlat36 = max(u_xlat36, 9.99999997e-07);
        u_xlat36 = inversesqrt(u_xlat36);
        u_xlat4.xyz = vec3(u_xlat36) * u_xlat3.xyz;
        u_xlat37 = dot(u_xlat4.xyz, unity_SpotDirection[3].xyz);
        u_xlat37 = max(u_xlat37, 0.0);
        u_xlat16_19.x = u_xlat37 + (-unity_LightAtten[3].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb4 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat36) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[3].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb4)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati34 = 4;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlati34<unity_VertexLightParams.x);
#else
    u_xlatb3 = u_xlati34<unity_VertexLightParams.x;
#endif
    u_xlatb35 = u_xlatb35 && u_xlatb3;
    if(u_xlatb35){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
        u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat4.x = unity_LightAtten[4].z * u_xlat36 + 1.0;
        u_xlat4.x = float(1.0) / u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightPosition[4].w!=0.0);
#else
        u_xlatb15 = unity_LightPosition[4].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb26 = !!(unity_LightAtten[4].w<u_xlat36);
#else
        u_xlatb26 = unity_LightAtten[4].w<u_xlat36;
#endif
        u_xlatb15 = u_xlatb26 && u_xlatb15;
        u_xlat16_8.x = (u_xlatb15) ? 0.0 : u_xlat4.x;
        u_xlat36 = max(u_xlat36, 9.99999997e-07);
        u_xlat36 = inversesqrt(u_xlat36);
        u_xlat4.xyz = vec3(u_xlat36) * u_xlat3.xyz;
        u_xlat37 = dot(u_xlat4.xyz, unity_SpotDirection[4].xyz);
        u_xlat37 = max(u_xlat37, 0.0);
        u_xlat16_19.x = u_xlat37 + (-unity_LightAtten[4].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb4 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat36) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[4].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb4)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati34 = 5;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlati34<unity_VertexLightParams.x);
#else
    u_xlatb3 = u_xlati34<unity_VertexLightParams.x;
#endif
    u_xlatb35 = u_xlatb35 && u_xlatb3;
    if(u_xlatb35){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
        u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat4.x = unity_LightAtten[5].z * u_xlat36 + 1.0;
        u_xlat4.x = float(1.0) / u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightPosition[5].w!=0.0);
#else
        u_xlatb15 = unity_LightPosition[5].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb26 = !!(unity_LightAtten[5].w<u_xlat36);
#else
        u_xlatb26 = unity_LightAtten[5].w<u_xlat36;
#endif
        u_xlatb15 = u_xlatb26 && u_xlatb15;
        u_xlat16_8.x = (u_xlatb15) ? 0.0 : u_xlat4.x;
        u_xlat36 = max(u_xlat36, 9.99999997e-07);
        u_xlat36 = inversesqrt(u_xlat36);
        u_xlat4.xyz = vec3(u_xlat36) * u_xlat3.xyz;
        u_xlat37 = dot(u_xlat4.xyz, unity_SpotDirection[5].xyz);
        u_xlat37 = max(u_xlat37, 0.0);
        u_xlat16_19.x = u_xlat37 + (-unity_LightAtten[5].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb4 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat36) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[5].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb4)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati34 = 6;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlati34<unity_VertexLightParams.x);
#else
    u_xlatb3 = u_xlati34<unity_VertexLightParams.x;
#endif
    u_xlatb35 = u_xlatb35 && u_xlatb3;
    if(u_xlatb35){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
        u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat4.x = unity_LightAtten[6].z * u_xlat36 + 1.0;
        u_xlat4.x = float(1.0) / u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightPosition[6].w!=0.0);
#else
        u_xlatb15 = unity_LightPosition[6].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb26 = !!(unity_LightAtten[6].w<u_xlat36);
#else
        u_xlatb26 = unity_LightAtten[6].w<u_xlat36;
#endif
        u_xlatb15 = u_xlatb26 && u_xlatb15;
        u_xlat16_8.x = (u_xlatb15) ? 0.0 : u_xlat4.x;
        u_xlat36 = max(u_xlat36, 9.99999997e-07);
        u_xlat36 = inversesqrt(u_xlat36);
        u_xlat4.xyz = vec3(u_xlat36) * u_xlat3.xyz;
        u_xlat37 = dot(u_xlat4.xyz, unity_SpotDirection[6].xyz);
        u_xlat37 = max(u_xlat37, 0.0);
        u_xlat16_19.x = u_xlat37 + (-unity_LightAtten[6].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb4 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat36) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[6].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb4)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati34 = 7;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(u_xlati34<unity_VertexLightParams.x);
#else
    u_xlatb34 = u_xlati34<unity_VertexLightParams.x;
#endif
    u_xlatb34 = u_xlatb34 && u_xlatb35;
    if(u_xlatb34){
        u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
        u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = unity_LightAtten[7].z * u_xlat34 + 1.0;
        u_xlat35 = float(1.0) / u_xlat35;
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(unity_LightPosition[7].w!=0.0);
#else
        u_xlatb3 = unity_LightPosition[7].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb14 = !!(unity_LightAtten[7].w<u_xlat34);
#else
        u_xlatb14 = unity_LightAtten[7].w<u_xlat34;
#endif
        u_xlatb3 = u_xlatb14 && u_xlatb3;
        u_xlat16_8.x = (u_xlatb3) ? 0.0 : u_xlat35;
        u_xlat34 = max(u_xlat34, 9.99999997e-07);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat34);
        u_xlat35 = dot(u_xlat3.xyz, unity_SpotDirection[7].xyz);
        u_xlat35 = max(u_xlat35, 0.0);
        u_xlat16_19.x = u_xlat35 + (-unity_LightAtten[7].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat3.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb35 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb35 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat0.xyz * vec3(u_xlat34) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_7 = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_7 = exp2(u_xlat16_7);
        u_xlat16_7 = min(u_xlat16_7, 1.0);
        u_xlat16_7 = u_xlat16_7 * u_xlat16_8.x;
        u_xlat16_19.xyz = vec3(u_xlat16_7) * unity_LightColor[7].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb35)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_9.xyz * _SpecColor.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR1.xyz = min(max(vs_COLOR1.xyz, 0.0), 1.0);
#else
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.xyz = u_xlat16_18.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = sqrt(u_xlat33);
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
    vs_TEXCOORD2 = u_xlat0.x;
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
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Illum;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_COLOR1;
in mediump float vs_TEXCOORD2;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat16_1.xyz + unity_FogColor.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 unity_FogParams;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _SpecColor;
uniform 	mediump float _Shininess;
uniform 	ivec4 unity_VertexLightParams;
uniform 	vec4 _Illum_ST;
uniform 	vec4 _MainTex_ST;
in highp vec3 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec3 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec3 vs_COLOR1;
out mediump float vs_TEXCOORD2;
out highp vec2 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
bool u_xlatb3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
vec3 u_xlat6;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
bool u_xlatb14;
bool u_xlatb15;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
bool u_xlatb26;
mediump float u_xlat16_29;
float u_xlat33;
float u_xlat34;
int u_xlati34;
bool u_xlatb34;
float u_xlat35;
bool u_xlatb35;
float u_xlat36;
bool u_xlatb36;
float u_xlat37;
mediump float u_xlat16_42;
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
    u_xlat33 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat33 = inversesqrt(u_xlat33);
    u_xlat1.xyz = vec3(u_xlat33) * u_xlat1.xyz;
    u_xlat33 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat34 = inversesqrt(u_xlat33);
    u_xlat2.xyz = u_xlat0.xyz * vec3(u_xlat34);
    u_xlat16_7 = _Shininess * 128.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(0<unity_VertexLightParams.x);
#else
    u_xlatb34 = 0<unity_VertexLightParams.x;
#endif
    if(u_xlatb34){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[0].www + unity_LightPosition[0].xyz;
        u_xlat34 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat35 = unity_LightAtten[0].z * u_xlat34 + 1.0;
        u_xlat35 = float(1.0) / u_xlat35;
#ifdef UNITY_ADRENO_ES3
        u_xlatb36 = !!(unity_LightPosition[0].w!=0.0);
#else
        u_xlatb36 = unity_LightPosition[0].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(unity_LightAtten[0].w<u_xlat34);
#else
        u_xlatb4 = unity_LightAtten[0].w<u_xlat34;
#endif
        u_xlatb36 = u_xlatb36 && u_xlatb4;
        u_xlat16_18.x = (u_xlatb36) ? 0.0 : u_xlat35;
        u_xlat34 = max(u_xlat34, 9.99999997e-07);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat4.xyz = vec3(u_xlat34) * u_xlat3.xyz;
        u_xlat35 = dot(u_xlat4.xyz, unity_SpotDirection[0].xyz);
        u_xlat35 = max(u_xlat35, 0.0);
        u_xlat16_29 = u_xlat35 + (-unity_LightAtten[0].x);
        u_xlat16_29 = u_xlat16_29 * unity_LightAtten[0].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_29 = min(max(u_xlat16_29, 0.0), 1.0);
#else
        u_xlat16_29 = clamp(u_xlat16_29, 0.0, 1.0);
#endif
        u_xlat16_18.x = u_xlat16_29 * u_xlat16_18.x;
        u_xlat16_18.x = u_xlat16_18.x * 0.5;
        u_xlat16_29 = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_29 = max(u_xlat16_29, 0.0);
        u_xlat16_8.xyz = vec3(u_xlat16_29) * _Color.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xyz * unity_LightColor[0].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb35 = !!(0.0<u_xlat16_29);
#else
        u_xlatb35 = 0.0<u_xlat16_29;
#endif
        u_xlat16_9.xyz = u_xlat3.xyz * vec3(u_xlat34) + (-u_xlat2.xyz);
        u_xlat16_29 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
        u_xlat16_29 = inversesqrt(u_xlat16_29);
        u_xlat16_9.xyz = vec3(u_xlat16_29) * u_xlat16_9.xyz;
        u_xlat16_29 = dot(u_xlat1.xyz, u_xlat16_9.xyz);
        u_xlat16_29 = max(u_xlat16_29, 0.0);
        u_xlat16_29 = log2(u_xlat16_29);
        u_xlat16_29 = u_xlat16_29 * u_xlat16_7;
        u_xlat16_29 = exp2(u_xlat16_29);
        u_xlat16_29 = min(u_xlat16_29, 1.0);
        u_xlat16_29 = u_xlat16_29 * u_xlat16_18.x;
        u_xlat16_9.xyz = vec3(u_xlat16_29) * unity_LightColor[0].xyz;
        u_xlat16_9.xyz = (bool(u_xlatb35)) ? u_xlat16_9.xyz : vec3(0.0, 0.0, 0.0);
        u_xlat16_18.xyz = u_xlat16_18.xxx * u_xlat16_8.xyz;
        u_xlat16_18.xyz = min(u_xlat16_18.xyz, vec3(1.0, 1.0, 1.0));
        u_xlati34 = 1;
    } else {
        u_xlat16_18.x = float(0.0);
        u_xlat16_18.y = float(0.0);
        u_xlat16_18.z = float(0.0);
        u_xlat16_9.x = float(0.0);
        u_xlat16_9.y = float(0.0);
        u_xlat16_9.z = float(0.0);
        u_xlati34 = 0;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(u_xlati34<unity_VertexLightParams.x);
#else
    u_xlatb35 = u_xlati34<unity_VertexLightParams.x;
#endif
    if(u_xlatb35){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[1].www + unity_LightPosition[1].xyz;
        u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat4.x = unity_LightAtten[1].z * u_xlat36 + 1.0;
        u_xlat4.x = float(1.0) / u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightPosition[1].w!=0.0);
#else
        u_xlatb15 = unity_LightPosition[1].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb26 = !!(unity_LightAtten[1].w<u_xlat36);
#else
        u_xlatb26 = unity_LightAtten[1].w<u_xlat36;
#endif
        u_xlatb15 = u_xlatb26 && u_xlatb15;
        u_xlat16_8.x = (u_xlatb15) ? 0.0 : u_xlat4.x;
        u_xlat36 = max(u_xlat36, 9.99999997e-07);
        u_xlat36 = inversesqrt(u_xlat36);
        u_xlat4.xyz = vec3(u_xlat36) * u_xlat3.xyz;
        u_xlat37 = dot(u_xlat4.xyz, unity_SpotDirection[1].xyz);
        u_xlat37 = max(u_xlat37, 0.0);
        u_xlat16_19.x = u_xlat37 + (-unity_LightAtten[1].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[1].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[1].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb4 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat36) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[1].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb4)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati34 = 2;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlati34<unity_VertexLightParams.x);
#else
    u_xlatb3 = u_xlati34<unity_VertexLightParams.x;
#endif
    u_xlatb35 = u_xlatb35 && u_xlatb3;
    if(u_xlatb35){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[2].www + unity_LightPosition[2].xyz;
        u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat4.x = unity_LightAtten[2].z * u_xlat36 + 1.0;
        u_xlat4.x = float(1.0) / u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightPosition[2].w!=0.0);
#else
        u_xlatb15 = unity_LightPosition[2].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb26 = !!(unity_LightAtten[2].w<u_xlat36);
#else
        u_xlatb26 = unity_LightAtten[2].w<u_xlat36;
#endif
        u_xlatb15 = u_xlatb26 && u_xlatb15;
        u_xlat16_8.x = (u_xlatb15) ? 0.0 : u_xlat4.x;
        u_xlat36 = max(u_xlat36, 9.99999997e-07);
        u_xlat36 = inversesqrt(u_xlat36);
        u_xlat4.xyz = vec3(u_xlat36) * u_xlat3.xyz;
        u_xlat37 = dot(u_xlat4.xyz, unity_SpotDirection[2].xyz);
        u_xlat37 = max(u_xlat37, 0.0);
        u_xlat16_19.x = u_xlat37 + (-unity_LightAtten[2].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[2].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[2].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb4 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat36) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[2].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb4)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati34 = 3;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlati34<unity_VertexLightParams.x);
#else
    u_xlatb3 = u_xlati34<unity_VertexLightParams.x;
#endif
    u_xlatb35 = u_xlatb35 && u_xlatb3;
    if(u_xlatb35){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[3].www + unity_LightPosition[3].xyz;
        u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat4.x = unity_LightAtten[3].z * u_xlat36 + 1.0;
        u_xlat4.x = float(1.0) / u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightPosition[3].w!=0.0);
#else
        u_xlatb15 = unity_LightPosition[3].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb26 = !!(unity_LightAtten[3].w<u_xlat36);
#else
        u_xlatb26 = unity_LightAtten[3].w<u_xlat36;
#endif
        u_xlatb15 = u_xlatb26 && u_xlatb15;
        u_xlat16_8.x = (u_xlatb15) ? 0.0 : u_xlat4.x;
        u_xlat36 = max(u_xlat36, 9.99999997e-07);
        u_xlat36 = inversesqrt(u_xlat36);
        u_xlat4.xyz = vec3(u_xlat36) * u_xlat3.xyz;
        u_xlat37 = dot(u_xlat4.xyz, unity_SpotDirection[3].xyz);
        u_xlat37 = max(u_xlat37, 0.0);
        u_xlat16_19.x = u_xlat37 + (-unity_LightAtten[3].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[3].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[3].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb4 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat36) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[3].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb4)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati34 = 4;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlati34<unity_VertexLightParams.x);
#else
    u_xlatb3 = u_xlati34<unity_VertexLightParams.x;
#endif
    u_xlatb35 = u_xlatb35 && u_xlatb3;
    if(u_xlatb35){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[4].www + unity_LightPosition[4].xyz;
        u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat4.x = unity_LightAtten[4].z * u_xlat36 + 1.0;
        u_xlat4.x = float(1.0) / u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightPosition[4].w!=0.0);
#else
        u_xlatb15 = unity_LightPosition[4].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb26 = !!(unity_LightAtten[4].w<u_xlat36);
#else
        u_xlatb26 = unity_LightAtten[4].w<u_xlat36;
#endif
        u_xlatb15 = u_xlatb26 && u_xlatb15;
        u_xlat16_8.x = (u_xlatb15) ? 0.0 : u_xlat4.x;
        u_xlat36 = max(u_xlat36, 9.99999997e-07);
        u_xlat36 = inversesqrt(u_xlat36);
        u_xlat4.xyz = vec3(u_xlat36) * u_xlat3.xyz;
        u_xlat37 = dot(u_xlat4.xyz, unity_SpotDirection[4].xyz);
        u_xlat37 = max(u_xlat37, 0.0);
        u_xlat16_19.x = u_xlat37 + (-unity_LightAtten[4].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[4].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[4].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb4 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat36) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[4].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb4)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati34 = 5;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlati34<unity_VertexLightParams.x);
#else
    u_xlatb3 = u_xlati34<unity_VertexLightParams.x;
#endif
    u_xlatb35 = u_xlatb35 && u_xlatb3;
    if(u_xlatb35){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[5].www + unity_LightPosition[5].xyz;
        u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat4.x = unity_LightAtten[5].z * u_xlat36 + 1.0;
        u_xlat4.x = float(1.0) / u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightPosition[5].w!=0.0);
#else
        u_xlatb15 = unity_LightPosition[5].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb26 = !!(unity_LightAtten[5].w<u_xlat36);
#else
        u_xlatb26 = unity_LightAtten[5].w<u_xlat36;
#endif
        u_xlatb15 = u_xlatb26 && u_xlatb15;
        u_xlat16_8.x = (u_xlatb15) ? 0.0 : u_xlat4.x;
        u_xlat36 = max(u_xlat36, 9.99999997e-07);
        u_xlat36 = inversesqrt(u_xlat36);
        u_xlat4.xyz = vec3(u_xlat36) * u_xlat3.xyz;
        u_xlat37 = dot(u_xlat4.xyz, unity_SpotDirection[5].xyz);
        u_xlat37 = max(u_xlat37, 0.0);
        u_xlat16_19.x = u_xlat37 + (-unity_LightAtten[5].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[5].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[5].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb4 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat36) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[5].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb4)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati34 = 6;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(u_xlati34<unity_VertexLightParams.x);
#else
    u_xlatb3 = u_xlati34<unity_VertexLightParams.x;
#endif
    u_xlatb35 = u_xlatb35 && u_xlatb3;
    if(u_xlatb35){
        u_xlat3.xyz = (-u_xlat0.xyz) * unity_LightPosition[6].www + unity_LightPosition[6].xyz;
        u_xlat36 = dot(u_xlat3.xyz, u_xlat3.xyz);
        u_xlat4.x = unity_LightAtten[6].z * u_xlat36 + 1.0;
        u_xlat4.x = float(1.0) / u_xlat4.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb15 = !!(unity_LightPosition[6].w!=0.0);
#else
        u_xlatb15 = unity_LightPosition[6].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb26 = !!(unity_LightAtten[6].w<u_xlat36);
#else
        u_xlatb26 = unity_LightAtten[6].w<u_xlat36;
#endif
        u_xlatb15 = u_xlatb26 && u_xlatb15;
        u_xlat16_8.x = (u_xlatb15) ? 0.0 : u_xlat4.x;
        u_xlat36 = max(u_xlat36, 9.99999997e-07);
        u_xlat36 = inversesqrt(u_xlat36);
        u_xlat4.xyz = vec3(u_xlat36) * u_xlat3.xyz;
        u_xlat37 = dot(u_xlat4.xyz, unity_SpotDirection[6].xyz);
        u_xlat37 = max(u_xlat37, 0.0);
        u_xlat16_19.x = u_xlat37 + (-unity_LightAtten[6].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[6].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat4.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[6].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb4 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb4 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat3.xyz * vec3(u_xlat36) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_19.x = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_19.x = exp2(u_xlat16_19.x);
        u_xlat16_19.x = min(u_xlat16_19.x, 1.0);
        u_xlat16_19.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_19.xyz = u_xlat16_19.xxx * unity_LightColor[6].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb4)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
        u_xlati34 = 7;
    }
#ifdef UNITY_ADRENO_ES3
    u_xlatb34 = !!(u_xlati34<unity_VertexLightParams.x);
#else
    u_xlatb34 = u_xlati34<unity_VertexLightParams.x;
#endif
    u_xlatb34 = u_xlatb34 && u_xlatb35;
    if(u_xlatb34){
        u_xlat0.xyz = (-u_xlat0.xyz) * unity_LightPosition[7].www + unity_LightPosition[7].xyz;
        u_xlat34 = dot(u_xlat0.xyz, u_xlat0.xyz);
        u_xlat35 = unity_LightAtten[7].z * u_xlat34 + 1.0;
        u_xlat35 = float(1.0) / u_xlat35;
#ifdef UNITY_ADRENO_ES3
        u_xlatb3 = !!(unity_LightPosition[7].w!=0.0);
#else
        u_xlatb3 = unity_LightPosition[7].w!=0.0;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb14 = !!(unity_LightAtten[7].w<u_xlat34);
#else
        u_xlatb14 = unity_LightAtten[7].w<u_xlat34;
#endif
        u_xlatb3 = u_xlatb14 && u_xlatb3;
        u_xlat16_8.x = (u_xlatb3) ? 0.0 : u_xlat35;
        u_xlat34 = max(u_xlat34, 9.99999997e-07);
        u_xlat34 = inversesqrt(u_xlat34);
        u_xlat3.xyz = u_xlat0.xyz * vec3(u_xlat34);
        u_xlat35 = dot(u_xlat3.xyz, unity_SpotDirection[7].xyz);
        u_xlat35 = max(u_xlat35, 0.0);
        u_xlat16_19.x = u_xlat35 + (-unity_LightAtten[7].x);
        u_xlat16_19.x = u_xlat16_19.x * unity_LightAtten[7].y;
#ifdef UNITY_ADRENO_ES3
        u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
        u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
        u_xlat16_8.x = u_xlat16_19.x * u_xlat16_8.x;
        u_xlat16_8.x = u_xlat16_8.x * 0.5;
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat3.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_10.xyz = u_xlat16_19.xxx * _Color.xyz;
        u_xlat16_10.xyz = u_xlat16_10.xyz * unity_LightColor[7].xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb35 = !!(0.0<u_xlat16_19.x);
#else
        u_xlatb35 = 0.0<u_xlat16_19.x;
#endif
        u_xlat16_19.xyz = u_xlat0.xyz * vec3(u_xlat34) + (-u_xlat2.xyz);
        u_xlat16_42 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
        u_xlat16_42 = inversesqrt(u_xlat16_42);
        u_xlat16_19.xyz = u_xlat16_19.xyz * vec3(u_xlat16_42);
        u_xlat16_19.x = dot(u_xlat1.xyz, u_xlat16_19.xyz);
        u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
        u_xlat16_19.x = log2(u_xlat16_19.x);
        u_xlat16_7 = u_xlat16_7 * u_xlat16_19.x;
        u_xlat16_7 = exp2(u_xlat16_7);
        u_xlat16_7 = min(u_xlat16_7, 1.0);
        u_xlat16_7 = u_xlat16_7 * u_xlat16_8.x;
        u_xlat16_19.xyz = vec3(u_xlat16_7) * unity_LightColor[7].xyz + u_xlat16_9.xyz;
        u_xlat16_9.xyz = (bool(u_xlatb35)) ? u_xlat16_19.xyz : u_xlat16_9.xyz;
        u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_10.xyz;
        u_xlat16_8.xyz = min(u_xlat16_8.xyz, vec3(1.0, 1.0, 1.0));
        u_xlat16_18.xyz = u_xlat16_18.xyz + u_xlat16_8.xyz;
    }
    vs_COLOR1.xyz = u_xlat16_9.xyz * _SpecColor.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR1.xyz = min(max(vs_COLOR1.xyz, 0.0), 1.0);
#else
    vs_COLOR1.xyz = clamp(vs_COLOR1.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.xyz = u_xlat16_18.xyz;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.xyz = min(max(vs_COLOR0.xyz, 0.0), 1.0);
#else
    vs_COLOR0.xyz = clamp(vs_COLOR0.xyz, 0.0, 1.0);
#endif
    vs_COLOR0.w = _Color.w;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0.w = min(max(vs_COLOR0.w, 0.0), 1.0);
#else
    vs_COLOR0.w = clamp(vs_COLOR0.w, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Illum_ST.xy + _Illum_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy * _MainTex_ST.xy + _MainTex_ST.zw;
    u_xlat0.x = sqrt(u_xlat33);
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
    vs_TEXCOORD2 = u_xlat0.x;
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
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Illum;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec3 vs_COLOR1;
in mediump float vs_TEXCOORD2;
in highp vec2 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0.x = texture(_Illum, vs_TEXCOORD0.xy).w;
    u_xlat16_1.xyz = (-vs_COLOR0.xyz) + _Color.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xxx * u_xlat16_1.xyz + vs_COLOR0.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD1.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vs_COLOR1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + (-unity_FogColor.xyz);
    SV_Target0.xyz = vec3(vs_TEXCOORD2) * u_xlat16_1.xyz + unity_FogColor.xyz;
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
Fallback "Legacy Shaders/VertexLit"
CustomEditor "LegacyIlluminShaderGUI"
}