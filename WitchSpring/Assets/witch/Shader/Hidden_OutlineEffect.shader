//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/OutlineEffect" {
Properties {
_MainTex ("Base (RGB)", 2D) = "white" { }
}
SubShader {
 Pass {
  LOD 200
  Tags { "RenderType" = "Transparent" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 7625
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	float _LineThicknessX;
uniform 	float _LineThicknessY;
uniform 	int _FlipY;
uniform lowp sampler2D _OutlineSource;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
ivec3 u_xlati1;
bvec3 u_xlatb1;
vec3 u_xlat2;
bvec3 u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
vec2 u_xlat10;
int u_xlati10;
vec2 u_xlat11;
vec2 u_xlat13;
int u_xlati15;
const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }

void main()
{
    u_xlatb0 = _FlipY==1;
    u_xlat5 = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat0.y = (u_xlatb0) ? u_xlat5 : vs_TEXCOORD0.y;
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlat1.x = _LineThicknessX;
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat10.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat2.xyz = texture2D(_OutlineSource, u_xlat10.xy).xyz;
    u_xlat11.x = (-_LineThicknessX);
    u_xlat10.xy = u_xlat0.xy + u_xlat11.xy;
    u_xlat1.xyz = texture2D(_OutlineSource, u_xlat10.xy).xyz;
    u_xlat3.x = float(0.0);
    u_xlat13.x = float(0.0);
    u_xlat3.y = _LineThicknessY;
    u_xlat10.xy = u_xlat0.xy + u_xlat3.xy;
    u_xlat4.xyz = texture2D(_OutlineSource, u_xlat10.xy).xyz;
    u_xlat13.y = (-_LineThicknessY);
    u_xlat10.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat3.xyz = texture2D(_OutlineSource, u_xlat10.xy).xyz;
    u_xlatb2.xyz = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.0), u_xlat2.xyzx).xyz;
    u_xlatb1.xyz = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.0), u_xlat1.xyzx).xyz;
    u_xlati1.xyz = op_or((ivec3(u_xlatb1.xyz) * -1), (ivec3(u_xlatb2.xyz) * -1));
    u_xlatb2.xyz = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.0), u_xlat4.xyzx).xyz;
    u_xlati1.xyz = op_or(u_xlati1.xyz, (ivec3(u_xlatb2.xyz) * -1));
    u_xlatb2.xyz = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.0), u_xlat3.xyzx).xyz;
    u_xlati1.xyz = op_or(u_xlati1.xyz, (ivec3(u_xlatb2.xyz) * -1));
    u_xlati10 = op_and(u_xlati1.z, u_xlati1.x);
    u_xlati15 = op_or(u_xlati1.x, u_xlati1.z);
    u_xlati15 = op_and(u_xlati15, u_xlati1.y);
    u_xlati10 = op_or(u_xlati15, u_xlati10);
    if(u_xlati10 != 0) {
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    } else {
        u_xlat10_0 = texture2D(_OutlineSource, u_xlat0.xy);
        SV_Target0 = u_xlat10_0;
        return;
    }
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
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	float _LineThicknessX;
uniform 	float _LineThicknessY;
uniform 	int _FlipY;
uniform lowp sampler2D _OutlineSource;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
ivec3 u_xlati1;
bvec3 u_xlatb1;
vec3 u_xlat2;
bvec3 u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
vec2 u_xlat10;
int u_xlati10;
vec2 u_xlat11;
vec2 u_xlat13;
int u_xlati15;
const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }

void main()
{
    u_xlatb0 = _FlipY==1;
    u_xlat5 = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat0.y = (u_xlatb0) ? u_xlat5 : vs_TEXCOORD0.y;
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlat1.x = _LineThicknessX;
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat10.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat2.xyz = texture2D(_OutlineSource, u_xlat10.xy).xyz;
    u_xlat11.x = (-_LineThicknessX);
    u_xlat10.xy = u_xlat0.xy + u_xlat11.xy;
    u_xlat1.xyz = texture2D(_OutlineSource, u_xlat10.xy).xyz;
    u_xlat3.x = float(0.0);
    u_xlat13.x = float(0.0);
    u_xlat3.y = _LineThicknessY;
    u_xlat10.xy = u_xlat0.xy + u_xlat3.xy;
    u_xlat4.xyz = texture2D(_OutlineSource, u_xlat10.xy).xyz;
    u_xlat13.y = (-_LineThicknessY);
    u_xlat10.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat3.xyz = texture2D(_OutlineSource, u_xlat10.xy).xyz;
    u_xlatb2.xyz = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.0), u_xlat2.xyzx).xyz;
    u_xlatb1.xyz = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.0), u_xlat1.xyzx).xyz;
    u_xlati1.xyz = op_or((ivec3(u_xlatb1.xyz) * -1), (ivec3(u_xlatb2.xyz) * -1));
    u_xlatb2.xyz = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.0), u_xlat4.xyzx).xyz;
    u_xlati1.xyz = op_or(u_xlati1.xyz, (ivec3(u_xlatb2.xyz) * -1));
    u_xlatb2.xyz = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.0), u_xlat3.xyzx).xyz;
    u_xlati1.xyz = op_or(u_xlati1.xyz, (ivec3(u_xlatb2.xyz) * -1));
    u_xlati10 = op_and(u_xlati1.z, u_xlati1.x);
    u_xlati15 = op_or(u_xlati1.x, u_xlati1.z);
    u_xlati15 = op_and(u_xlati15, u_xlati1.y);
    u_xlati10 = op_or(u_xlati15, u_xlati10);
    if(u_xlati10 != 0) {
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    } else {
        u_xlat10_0 = texture2D(_OutlineSource, u_xlat0.xy);
        SV_Target0 = u_xlat10_0;
        return;
    }
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
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	float _LineThicknessX;
uniform 	float _LineThicknessY;
uniform 	int _FlipY;
uniform lowp sampler2D _OutlineSource;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec2 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec3 u_xlat1;
ivec3 u_xlati1;
bvec3 u_xlatb1;
vec3 u_xlat2;
bvec3 u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
vec2 u_xlat10;
int u_xlati10;
vec2 u_xlat11;
vec2 u_xlat13;
int u_xlati15;
const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }

void main()
{
    u_xlatb0 = _FlipY==1;
    u_xlat5 = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat0.y = (u_xlatb0) ? u_xlat5 : vs_TEXCOORD0.y;
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlat1.x = _LineThicknessX;
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat10.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat2.xyz = texture2D(_OutlineSource, u_xlat10.xy).xyz;
    u_xlat11.x = (-_LineThicknessX);
    u_xlat10.xy = u_xlat0.xy + u_xlat11.xy;
    u_xlat1.xyz = texture2D(_OutlineSource, u_xlat10.xy).xyz;
    u_xlat3.x = float(0.0);
    u_xlat13.x = float(0.0);
    u_xlat3.y = _LineThicknessY;
    u_xlat10.xy = u_xlat0.xy + u_xlat3.xy;
    u_xlat4.xyz = texture2D(_OutlineSource, u_xlat10.xy).xyz;
    u_xlat13.y = (-_LineThicknessY);
    u_xlat10.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat3.xyz = texture2D(_OutlineSource, u_xlat10.xy).xyz;
    u_xlatb2.xyz = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.0), u_xlat2.xyzx).xyz;
    u_xlatb1.xyz = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.0), u_xlat1.xyzx).xyz;
    u_xlati1.xyz = op_or((ivec3(u_xlatb1.xyz) * -1), (ivec3(u_xlatb2.xyz) * -1));
    u_xlatb2.xyz = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.0), u_xlat4.xyzx).xyz;
    u_xlati1.xyz = op_or(u_xlati1.xyz, (ivec3(u_xlatb2.xyz) * -1));
    u_xlatb2.xyz = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.0), u_xlat3.xyzx).xyz;
    u_xlati1.xyz = op_or(u_xlati1.xyz, (ivec3(u_xlatb2.xyz) * -1));
    u_xlati10 = op_and(u_xlati1.z, u_xlati1.x);
    u_xlati15 = op_or(u_xlati1.x, u_xlati1.z);
    u_xlati15 = op_and(u_xlati15, u_xlati1.y);
    u_xlati10 = op_or(u_xlati15, u_xlati10);
    if(u_xlati10 != 0) {
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    } else {
        u_xlat10_0 = texture2D(_OutlineSource, u_xlat0.xy);
        SV_Target0 = u_xlat10_0;
        return;
    }
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	float _LineThicknessX;
uniform 	float _LineThicknessY;
uniform 	int _FlipY;
UNITY_LOCATION(0) uniform mediump sampler2D _OutlineSource;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
ivec3 u_xlati1;
bvec3 u_xlatb1;
vec3 u_xlat2;
bvec3 u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
vec2 u_xlat10;
int u_xlati10;
vec2 u_xlat11;
vec2 u_xlat13;
int u_xlati15;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_FlipY==1);
#else
    u_xlatb0 = _FlipY==1;
#endif
    u_xlat5 = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat0.y = (u_xlatb0) ? u_xlat5 : vs_TEXCOORD0.y;
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlat1.x = _LineThicknessX;
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat10.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat2.xyz = texture(_OutlineSource, u_xlat10.xy).xyz;
    u_xlat11.x = (-_LineThicknessX);
    u_xlat10.xy = u_xlat0.xy + u_xlat11.xy;
    u_xlat1.xyz = texture(_OutlineSource, u_xlat10.xy).xyz;
    u_xlat3.x = float(0.0);
    u_xlat13.x = float(0.0);
    u_xlat3.y = _LineThicknessY;
    u_xlat10.xy = u_xlat0.xy + u_xlat3.xy;
    u_xlat4.xyz = texture(_OutlineSource, u_xlat10.xy).xyz;
    u_xlat13.y = (-_LineThicknessY);
    u_xlat10.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat3.xyz = texture(_OutlineSource, u_xlat10.xy).xyz;
    u_xlatb2.xyz = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.0), u_xlat2.xyzx).xyz;
    u_xlatb1.xyz = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.0), u_xlat1.xyzx).xyz;
    u_xlati1.xyz = ivec3(uvec3((uint(u_xlatb1.x) * 0xffffffffu) | (uint(u_xlatb2.x) * 0xffffffffu), (uint(u_xlatb1.y) * 0xffffffffu) | (uint(u_xlatb2.y) * 0xffffffffu), (uint(u_xlatb1.z) * 0xffffffffu) | (uint(u_xlatb2.z) * 0xffffffffu)));
    u_xlatb2.xyz = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.0), u_xlat4.xyzx).xyz;
    u_xlati1.xyz = ivec3(uvec3(uint(u_xlati1.x) | (uint(u_xlatb2.x) * 0xffffffffu), uint(u_xlati1.y) | (uint(u_xlatb2.y) * 0xffffffffu), uint(u_xlati1.z) | (uint(u_xlatb2.z) * 0xffffffffu)));
    u_xlatb2.xyz = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.0), u_xlat3.xyzx).xyz;
    u_xlati1.xyz = ivec3(uvec3(uint(u_xlati1.x) | (uint(u_xlatb2.x) * 0xffffffffu), uint(u_xlati1.y) | (uint(u_xlatb2.y) * 0xffffffffu), uint(u_xlati1.z) | (uint(u_xlatb2.z) * 0xffffffffu)));
    u_xlati10 = int(uint(uint(u_xlati1.z) & uint(u_xlati1.x)));
    u_xlati15 = int(uint(uint(u_xlati1.x) | uint(u_xlati1.z)));
    u_xlati15 = int(uint(uint(u_xlati15) & uint(u_xlati1.y)));
    u_xlati10 = int(uint(uint(u_xlati15) | uint(u_xlati10)));
    if(u_xlati10 != 0) {
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    } else {
        u_xlat16_0 = texture(_OutlineSource, u_xlat0.xy);
        SV_Target0 = u_xlat16_0;
        return;
    }
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	float _LineThicknessX;
uniform 	float _LineThicknessY;
uniform 	int _FlipY;
UNITY_LOCATION(0) uniform mediump sampler2D _OutlineSource;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
ivec3 u_xlati1;
bvec3 u_xlatb1;
vec3 u_xlat2;
bvec3 u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
vec2 u_xlat10;
int u_xlati10;
vec2 u_xlat11;
vec2 u_xlat13;
int u_xlati15;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_FlipY==1);
#else
    u_xlatb0 = _FlipY==1;
#endif
    u_xlat5 = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat0.y = (u_xlatb0) ? u_xlat5 : vs_TEXCOORD0.y;
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlat1.x = _LineThicknessX;
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat10.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat2.xyz = texture(_OutlineSource, u_xlat10.xy).xyz;
    u_xlat11.x = (-_LineThicknessX);
    u_xlat10.xy = u_xlat0.xy + u_xlat11.xy;
    u_xlat1.xyz = texture(_OutlineSource, u_xlat10.xy).xyz;
    u_xlat3.x = float(0.0);
    u_xlat13.x = float(0.0);
    u_xlat3.y = _LineThicknessY;
    u_xlat10.xy = u_xlat0.xy + u_xlat3.xy;
    u_xlat4.xyz = texture(_OutlineSource, u_xlat10.xy).xyz;
    u_xlat13.y = (-_LineThicknessY);
    u_xlat10.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat3.xyz = texture(_OutlineSource, u_xlat10.xy).xyz;
    u_xlatb2.xyz = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.0), u_xlat2.xyzx).xyz;
    u_xlatb1.xyz = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.0), u_xlat1.xyzx).xyz;
    u_xlati1.xyz = ivec3(uvec3((uint(u_xlatb1.x) * 0xffffffffu) | (uint(u_xlatb2.x) * 0xffffffffu), (uint(u_xlatb1.y) * 0xffffffffu) | (uint(u_xlatb2.y) * 0xffffffffu), (uint(u_xlatb1.z) * 0xffffffffu) | (uint(u_xlatb2.z) * 0xffffffffu)));
    u_xlatb2.xyz = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.0), u_xlat4.xyzx).xyz;
    u_xlati1.xyz = ivec3(uvec3(uint(u_xlati1.x) | (uint(u_xlatb2.x) * 0xffffffffu), uint(u_xlati1.y) | (uint(u_xlatb2.y) * 0xffffffffu), uint(u_xlati1.z) | (uint(u_xlatb2.z) * 0xffffffffu)));
    u_xlatb2.xyz = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.0), u_xlat3.xyzx).xyz;
    u_xlati1.xyz = ivec3(uvec3(uint(u_xlati1.x) | (uint(u_xlatb2.x) * 0xffffffffu), uint(u_xlati1.y) | (uint(u_xlatb2.y) * 0xffffffffu), uint(u_xlati1.z) | (uint(u_xlatb2.z) * 0xffffffffu)));
    u_xlati10 = int(uint(uint(u_xlati1.z) & uint(u_xlati1.x)));
    u_xlati15 = int(uint(uint(u_xlati1.x) | uint(u_xlati1.z)));
    u_xlati15 = int(uint(uint(u_xlati15) & uint(u_xlati1.y)));
    u_xlati10 = int(uint(uint(u_xlati15) | uint(u_xlati10)));
    if(u_xlati10 != 0) {
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    } else {
        u_xlat16_0 = texture(_OutlineSource, u_xlat0.xy);
        SV_Target0 = u_xlat16_0;
        return;
    }
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	float _LineThicknessX;
uniform 	float _LineThicknessY;
uniform 	int _FlipY;
UNITY_LOCATION(0) uniform mediump sampler2D _OutlineSource;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
ivec3 u_xlati1;
bvec3 u_xlatb1;
vec3 u_xlat2;
bvec3 u_xlatb2;
vec3 u_xlat3;
vec3 u_xlat4;
float u_xlat5;
vec2 u_xlat10;
int u_xlati10;
vec2 u_xlat11;
vec2 u_xlat13;
int u_xlati15;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_FlipY==1);
#else
    u_xlatb0 = _FlipY==1;
#endif
    u_xlat5 = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat0.y = (u_xlatb0) ? u_xlat5 : vs_TEXCOORD0.y;
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlat1.x = _LineThicknessX;
    u_xlat1.y = float(0.0);
    u_xlat11.y = float(0.0);
    u_xlat10.xy = u_xlat0.xy + u_xlat1.xy;
    u_xlat2.xyz = texture(_OutlineSource, u_xlat10.xy).xyz;
    u_xlat11.x = (-_LineThicknessX);
    u_xlat10.xy = u_xlat0.xy + u_xlat11.xy;
    u_xlat1.xyz = texture(_OutlineSource, u_xlat10.xy).xyz;
    u_xlat3.x = float(0.0);
    u_xlat13.x = float(0.0);
    u_xlat3.y = _LineThicknessY;
    u_xlat10.xy = u_xlat0.xy + u_xlat3.xy;
    u_xlat4.xyz = texture(_OutlineSource, u_xlat10.xy).xyz;
    u_xlat13.y = (-_LineThicknessY);
    u_xlat10.xy = u_xlat0.xy + u_xlat13.xy;
    u_xlat3.xyz = texture(_OutlineSource, u_xlat10.xy).xyz;
    u_xlatb2.xyz = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.0), u_xlat2.xyzx).xyz;
    u_xlatb1.xyz = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.0), u_xlat1.xyzx).xyz;
    u_xlati1.xyz = ivec3(uvec3((uint(u_xlatb1.x) * 0xffffffffu) | (uint(u_xlatb2.x) * 0xffffffffu), (uint(u_xlatb1.y) * 0xffffffffu) | (uint(u_xlatb2.y) * 0xffffffffu), (uint(u_xlatb1.z) * 0xffffffffu) | (uint(u_xlatb2.z) * 0xffffffffu)));
    u_xlatb2.xyz = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.0), u_xlat4.xyzx).xyz;
    u_xlati1.xyz = ivec3(uvec3(uint(u_xlati1.x) | (uint(u_xlatb2.x) * 0xffffffffu), uint(u_xlati1.y) | (uint(u_xlatb2.y) * 0xffffffffu), uint(u_xlati1.z) | (uint(u_xlatb2.z) * 0xffffffffu)));
    u_xlatb2.xyz = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.0), u_xlat3.xyzx).xyz;
    u_xlati1.xyz = ivec3(uvec3(uint(u_xlati1.x) | (uint(u_xlatb2.x) * 0xffffffffu), uint(u_xlati1.y) | (uint(u_xlatb2.y) * 0xffffffffu), uint(u_xlati1.z) | (uint(u_xlatb2.z) * 0xffffffffu)));
    u_xlati10 = int(uint(uint(u_xlati1.z) & uint(u_xlati1.x)));
    u_xlati15 = int(uint(uint(u_xlati1.x) | uint(u_xlati1.z)));
    u_xlati15 = int(uint(uint(u_xlati15) & uint(u_xlati1.y)));
    u_xlati10 = int(uint(uint(u_xlati15) | uint(u_xlati10)));
    if(u_xlati10 != 0) {
        SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
        return;
    } else {
        u_xlat16_0 = texture(_OutlineSource, u_xlat0.xy);
        SV_Target0 = u_xlat16_0;
        return;
    }
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
  LOD 200
  Tags { "RenderType" = "Transparent" }
  ZTest Always
  ZWrite Off
  Cull Off
  GpuProgramID 110034
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	float _LineThicknessX;
uniform 	float _LineThicknessY;
uniform 	float _LineIntensity;
uniform 	mediump vec4 _LineColor1;
uniform 	mediump vec4 _LineColor2;
uniform 	mediump vec4 _LineColor3;
uniform 	int _FlipY;
uniform 	int _Dark;
uniform 	float _FillAmount;
uniform 	int _CornerOutlines;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _OutlineSource;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
ivec2 u_xlati3;
bvec2 u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
ivec4 u_xlati6;
bvec4 u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
bvec4 u_xlatb7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
vec4 u_xlat9;
mediump vec4 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
float u_xlat13;
bool u_xlatb13;
bvec2 u_xlatb19;
float u_xlat26;
bool u_xlatb26;
vec2 u_xlat28;
bvec2 u_xlatb29;
vec2 u_xlat30;
bvec2 u_xlatb32;
bool u_xlatb39;
const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlatb0 = _FlipY==1;
    u_xlat13 = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat0.y = (u_xlatb0) ? u_xlat13 : vs_TEXCOORD0.y;
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlat26 = texture2D(_OutlineSource, u_xlat0.xy).w;
    u_xlat2.x = _LineThicknessX;
    u_xlat2.y = float(0.0);
    u_xlat28.y = float(0.0);
    u_xlat2.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat3.xyz = texture2D(_OutlineSource, u_xlat2.xy).xyz;
    u_xlat28.x = (-_LineThicknessX);
    u_xlat2.xy = u_xlat0.xy + u_xlat28.xy;
    u_xlat2.xyz = texture2D(_OutlineSource, u_xlat2.xy).xyz;
    u_xlat4.x = float(0.0);
    u_xlat30.x = float(0.0);
    u_xlat4.y = _LineThicknessY;
    u_xlat4.xy = u_xlat0.xy + u_xlat4.xy;
    u_xlat5.xyz = texture2D(_OutlineSource, u_xlat4.xy).xyz;
    u_xlat30.y = (-_LineThicknessY);
    u_xlat4.xy = u_xlat0.xy + u_xlat30.xy;
    u_xlat4.xyz = texture2D(_OutlineSource, u_xlat4.xy).xyz;
    u_xlatb26 = u_xlat26<0.949999988;
    u_xlatb39 = _Dark!=0;
    u_xlatb39 = u_xlatb39 && u_xlatb26;
    if(_CornerOutlines != 0) {
        u_xlat6.xy = u_xlat0.xy + vec2(_LineThicknessX, _LineThicknessY);
        u_xlat6.xyz = texture2D(_OutlineSource, u_xlat6.xy).xyz;
        u_xlat7.xy = u_xlat0.xy + (-vec2(_LineThicknessX, _LineThicknessY));
        u_xlat7.xyz = texture2D(_OutlineSource, u_xlat7.xy).xyz;
        u_xlat8 = vec4(_LineThicknessX, _LineThicknessY, _LineThicknessX, _LineThicknessY) * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat0.xyxy;
        u_xlat9.xyz = texture2D(_OutlineSource, u_xlat8.xy).xyz;
        u_xlat8.xyz = texture2D(_OutlineSource, u_xlat8.zw).xyz;
        u_xlatb0 = 0.949999988<u_xlat3.x;
        u_xlatb13 = 0.949999988<u_xlat2.x;
        u_xlatb0 = u_xlatb13 || u_xlatb0;
        u_xlatb13 = 0.949999988<u_xlat5.x;
        u_xlatb0 = u_xlatb13 || u_xlatb0;
        u_xlatb13 = 0.949999988<u_xlat4.x;
        u_xlatb0 = u_xlatb13 || u_xlatb0;
        u_xlatb13 = 0.949999988<u_xlat6.x;
        u_xlatb0 = u_xlatb13 || u_xlatb0;
        u_xlatb13 = 0.949999988<u_xlat7.x;
        u_xlatb0 = u_xlatb13 || u_xlatb0;
        u_xlatb13 = 0.949999988<u_xlat9.x;
        u_xlatb0 = u_xlatb13 || u_xlatb0;
        u_xlatb13 = 0.949999988<u_xlat8.x;
        u_xlatb0 = u_xlatb13 || u_xlatb0;
        if(u_xlatb0){
            u_xlat10 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor1;
            u_xlat10 = u_xlat10 * _LineColor1.wwww;
            u_xlat16_11.x = (-_LineColor1.w) + 1.0;
            u_xlat16_11 = u_xlat1 * u_xlat16_11.xxxx;
            u_xlat16_11 = (bool(u_xlatb39)) ? u_xlat16_11 : u_xlat1;
            u_xlat16_10 = u_xlat10;
            u_xlati0 = -1;
        } else {
            u_xlatb6.xw = lessThan(vec4(0.949999988, 0.0, 0.0, 0.949999988), u_xlat3.yyyz).xw;
            u_xlatb7.xw = lessThan(vec4(0.949999988, 0.0, 0.0, 0.949999988), u_xlat2.yyyz).xw;
            u_xlati6.xw = op_or((ivec2(u_xlatb6.xw) * -1), (ivec2(u_xlatb7.xw) * -1));
            u_xlatb7.xw = lessThan(vec4(0.949999988, 0.0, 0.0, 0.949999988), u_xlat5.yyyz).xw;
            u_xlati6.xw = op_or(u_xlati6.xw, (ivec2(u_xlatb7.xw) * -1));
            u_xlatb7.xw = lessThan(vec4(0.949999988, 0.0, 0.0, 0.949999988), u_xlat4.yyyz).xw;
            u_xlati6.xw = op_or(u_xlati6.xw, (ivec2(u_xlatb7.xw) * -1));
            u_xlatb19.xy = lessThan(vec4(0.949999988, 0.949999988, 0.0, 0.0), u_xlat6.yzyy).xy;
            u_xlati6.xy = op_or((ivec2(u_xlatb19.xy) * -1), u_xlati6.xw);
            u_xlatb32.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat7.yzyz).xy;
            u_xlati6.xy = op_or((ivec2(u_xlatb32.xy) * -1), u_xlati6.xy);
            u_xlatb32.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat9.yzyz).xy;
            u_xlati6.xy = op_or((ivec2(u_xlatb32.xy) * -1), u_xlati6.xy);
            u_xlatb32.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat8.yzyz).xy;
            u_xlat7 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor2;
            u_xlat7 = u_xlat7 * _LineColor2.wwww;
            u_xlat16_12.x = (-_LineColor2.w) + 1.0;
            u_xlat16_8 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_8 = (bool(u_xlatb39)) ? u_xlat16_8 : u_xlat1;
            u_xlati6.xy = op_or((ivec2(u_xlatb32.xy) * -1), u_xlati6.xy);
            u_xlat9 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor3;
            u_xlat9 = u_xlat9 * _LineColor3.wwww;
            u_xlat16_12.x = (-_LineColor3.w) + 1.0;
            u_xlat16_12 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_12 = (bool(u_xlatb39)) ? u_xlat16_12 : u_xlat1;
            u_xlat16_12 = (u_xlati6.y != 0) ? u_xlat16_12 : u_xlat1;
            u_xlat16_9 = (u_xlati6.y != 0) ? u_xlat9 : vec4(0.0, 0.0, 0.0, 0.0);
            u_xlat16_11 = (u_xlati6.x != 0) ? u_xlat16_8 : u_xlat16_12;
            u_xlat16_10 = (u_xlati6.x != 0) ? u_xlat7 : u_xlat16_9;
            u_xlati0 = op_or(u_xlati6.y, u_xlati6.x);
        }
        u_xlat6 = u_xlat16_10 * vec4(vec4(_FillAmount, _FillAmount, _FillAmount, _FillAmount));
        u_xlat16_6 = (bool(u_xlatb26)) ? u_xlat16_10 : u_xlat6;
    } else {
        u_xlatb13 = 0.949999988<u_xlat3.x;
        u_xlatb3.x = 0.949999988<u_xlat2.x;
        u_xlatb13 = u_xlatb13 || u_xlatb3.x;
        u_xlatb3.x = 0.949999988<u_xlat5.x;
        u_xlatb13 = u_xlatb13 || u_xlatb3.x;
        u_xlatb3.x = 0.949999988<u_xlat4.x;
        u_xlatb13 = u_xlatb13 || u_xlatb3.x;
        if(u_xlatb13){
            u_xlat7 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor1;
            u_xlat7 = u_xlat7 * _LineColor1.wwww;
            u_xlat16_12.x = (-_LineColor1.w) + 1.0;
            u_xlat16_8 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_11 = (bool(u_xlatb39)) ? u_xlat16_8 : u_xlat1;
            u_xlat16_7 = u_xlat7;
            u_xlati0 = -1;
        } else {
            u_xlatb3.xy = lessThan(vec4(0.949999988, 0.949999988, 0.0, 0.0), u_xlat3.yzyy).xy;
            u_xlatb29.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat2.yzyz).xy;
            u_xlati3.xy = op_or((ivec2(u_xlatb29.xy) * -1), (ivec2(u_xlatb3.xy) * -1));
            u_xlatb29.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat5.yzyz).xy;
            u_xlati3.xy = op_or((ivec2(u_xlatb29.xy) * -1), u_xlati3.xy);
            u_xlatb29.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat4.yzyz).xy;
            u_xlat2 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor2;
            u_xlat2 = u_xlat2 * _LineColor2.wwww;
            u_xlat16_12.x = (-_LineColor2.w) + 1.0;
            u_xlat16_4 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_4 = (bool(u_xlatb39)) ? u_xlat16_4 : u_xlat1;
            u_xlati3.xy = op_or((ivec2(u_xlatb29.xy) * -1), u_xlati3.xy);
            u_xlat5 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor3;
            u_xlat5 = u_xlat5 * _LineColor3.wwww;
            u_xlat16_12.x = (-_LineColor3.w) + 1.0;
            u_xlat16_8 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_8 = (bool(u_xlatb39)) ? u_xlat16_8 : u_xlat1;
            u_xlat16_1 = (u_xlati3.y != 0) ? u_xlat16_8 : u_xlat1;
            u_xlat16_5 = (u_xlati3.y != 0) ? u_xlat5 : vec4(0.0, 0.0, 0.0, 0.0);
            u_xlat16_11 = (u_xlati3.x != 0) ? u_xlat16_4 : u_xlat16_1;
            u_xlat16_7 = (u_xlati3.x != 0) ? u_xlat2 : u_xlat16_5;
            u_xlati0 = op_or(u_xlati3.y, u_xlati3.x);
        }
        u_xlat1 = u_xlat16_7 * vec4(vec4(_FillAmount, _FillAmount, _FillAmount, _FillAmount));
        u_xlat16_6 = (bool(u_xlatb26)) ? u_xlat16_7 : u_xlat1;
    }
    if(u_xlati0 != 0) {
        u_xlat16_0 = u_xlat16_6 + u_xlat16_11;
        u_xlat1 = (-u_xlat16_0) + u_xlat16_6;
        u_xlat0 = vec4(vec4(_FillAmount, _FillAmount, _FillAmount, _FillAmount)) * u_xlat1 + u_xlat16_0;
        SV_Target0 = u_xlat0;
        return;
    } else {
        SV_Target0 = u_xlat16_11;
        return;
    }
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
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	float _LineThicknessX;
uniform 	float _LineThicknessY;
uniform 	float _LineIntensity;
uniform 	mediump vec4 _LineColor1;
uniform 	mediump vec4 _LineColor2;
uniform 	mediump vec4 _LineColor3;
uniform 	int _FlipY;
uniform 	int _Dark;
uniform 	float _FillAmount;
uniform 	int _CornerOutlines;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _OutlineSource;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
ivec2 u_xlati3;
bvec2 u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
ivec4 u_xlati6;
bvec4 u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
bvec4 u_xlatb7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
vec4 u_xlat9;
mediump vec4 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
float u_xlat13;
bool u_xlatb13;
bvec2 u_xlatb19;
float u_xlat26;
bool u_xlatb26;
vec2 u_xlat28;
bvec2 u_xlatb29;
vec2 u_xlat30;
bvec2 u_xlatb32;
bool u_xlatb39;
const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlatb0 = _FlipY==1;
    u_xlat13 = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat0.y = (u_xlatb0) ? u_xlat13 : vs_TEXCOORD0.y;
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlat26 = texture2D(_OutlineSource, u_xlat0.xy).w;
    u_xlat2.x = _LineThicknessX;
    u_xlat2.y = float(0.0);
    u_xlat28.y = float(0.0);
    u_xlat2.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat3.xyz = texture2D(_OutlineSource, u_xlat2.xy).xyz;
    u_xlat28.x = (-_LineThicknessX);
    u_xlat2.xy = u_xlat0.xy + u_xlat28.xy;
    u_xlat2.xyz = texture2D(_OutlineSource, u_xlat2.xy).xyz;
    u_xlat4.x = float(0.0);
    u_xlat30.x = float(0.0);
    u_xlat4.y = _LineThicknessY;
    u_xlat4.xy = u_xlat0.xy + u_xlat4.xy;
    u_xlat5.xyz = texture2D(_OutlineSource, u_xlat4.xy).xyz;
    u_xlat30.y = (-_LineThicknessY);
    u_xlat4.xy = u_xlat0.xy + u_xlat30.xy;
    u_xlat4.xyz = texture2D(_OutlineSource, u_xlat4.xy).xyz;
    u_xlatb26 = u_xlat26<0.949999988;
    u_xlatb39 = _Dark!=0;
    u_xlatb39 = u_xlatb39 && u_xlatb26;
    if(_CornerOutlines != 0) {
        u_xlat6.xy = u_xlat0.xy + vec2(_LineThicknessX, _LineThicknessY);
        u_xlat6.xyz = texture2D(_OutlineSource, u_xlat6.xy).xyz;
        u_xlat7.xy = u_xlat0.xy + (-vec2(_LineThicknessX, _LineThicknessY));
        u_xlat7.xyz = texture2D(_OutlineSource, u_xlat7.xy).xyz;
        u_xlat8 = vec4(_LineThicknessX, _LineThicknessY, _LineThicknessX, _LineThicknessY) * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat0.xyxy;
        u_xlat9.xyz = texture2D(_OutlineSource, u_xlat8.xy).xyz;
        u_xlat8.xyz = texture2D(_OutlineSource, u_xlat8.zw).xyz;
        u_xlatb0 = 0.949999988<u_xlat3.x;
        u_xlatb13 = 0.949999988<u_xlat2.x;
        u_xlatb0 = u_xlatb13 || u_xlatb0;
        u_xlatb13 = 0.949999988<u_xlat5.x;
        u_xlatb0 = u_xlatb13 || u_xlatb0;
        u_xlatb13 = 0.949999988<u_xlat4.x;
        u_xlatb0 = u_xlatb13 || u_xlatb0;
        u_xlatb13 = 0.949999988<u_xlat6.x;
        u_xlatb0 = u_xlatb13 || u_xlatb0;
        u_xlatb13 = 0.949999988<u_xlat7.x;
        u_xlatb0 = u_xlatb13 || u_xlatb0;
        u_xlatb13 = 0.949999988<u_xlat9.x;
        u_xlatb0 = u_xlatb13 || u_xlatb0;
        u_xlatb13 = 0.949999988<u_xlat8.x;
        u_xlatb0 = u_xlatb13 || u_xlatb0;
        if(u_xlatb0){
            u_xlat10 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor1;
            u_xlat10 = u_xlat10 * _LineColor1.wwww;
            u_xlat16_11.x = (-_LineColor1.w) + 1.0;
            u_xlat16_11 = u_xlat1 * u_xlat16_11.xxxx;
            u_xlat16_11 = (bool(u_xlatb39)) ? u_xlat16_11 : u_xlat1;
            u_xlat16_10 = u_xlat10;
            u_xlati0 = -1;
        } else {
            u_xlatb6.xw = lessThan(vec4(0.949999988, 0.0, 0.0, 0.949999988), u_xlat3.yyyz).xw;
            u_xlatb7.xw = lessThan(vec4(0.949999988, 0.0, 0.0, 0.949999988), u_xlat2.yyyz).xw;
            u_xlati6.xw = op_or((ivec2(u_xlatb6.xw) * -1), (ivec2(u_xlatb7.xw) * -1));
            u_xlatb7.xw = lessThan(vec4(0.949999988, 0.0, 0.0, 0.949999988), u_xlat5.yyyz).xw;
            u_xlati6.xw = op_or(u_xlati6.xw, (ivec2(u_xlatb7.xw) * -1));
            u_xlatb7.xw = lessThan(vec4(0.949999988, 0.0, 0.0, 0.949999988), u_xlat4.yyyz).xw;
            u_xlati6.xw = op_or(u_xlati6.xw, (ivec2(u_xlatb7.xw) * -1));
            u_xlatb19.xy = lessThan(vec4(0.949999988, 0.949999988, 0.0, 0.0), u_xlat6.yzyy).xy;
            u_xlati6.xy = op_or((ivec2(u_xlatb19.xy) * -1), u_xlati6.xw);
            u_xlatb32.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat7.yzyz).xy;
            u_xlati6.xy = op_or((ivec2(u_xlatb32.xy) * -1), u_xlati6.xy);
            u_xlatb32.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat9.yzyz).xy;
            u_xlati6.xy = op_or((ivec2(u_xlatb32.xy) * -1), u_xlati6.xy);
            u_xlatb32.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat8.yzyz).xy;
            u_xlat7 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor2;
            u_xlat7 = u_xlat7 * _LineColor2.wwww;
            u_xlat16_12.x = (-_LineColor2.w) + 1.0;
            u_xlat16_8 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_8 = (bool(u_xlatb39)) ? u_xlat16_8 : u_xlat1;
            u_xlati6.xy = op_or((ivec2(u_xlatb32.xy) * -1), u_xlati6.xy);
            u_xlat9 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor3;
            u_xlat9 = u_xlat9 * _LineColor3.wwww;
            u_xlat16_12.x = (-_LineColor3.w) + 1.0;
            u_xlat16_12 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_12 = (bool(u_xlatb39)) ? u_xlat16_12 : u_xlat1;
            u_xlat16_12 = (u_xlati6.y != 0) ? u_xlat16_12 : u_xlat1;
            u_xlat16_9 = (u_xlati6.y != 0) ? u_xlat9 : vec4(0.0, 0.0, 0.0, 0.0);
            u_xlat16_11 = (u_xlati6.x != 0) ? u_xlat16_8 : u_xlat16_12;
            u_xlat16_10 = (u_xlati6.x != 0) ? u_xlat7 : u_xlat16_9;
            u_xlati0 = op_or(u_xlati6.y, u_xlati6.x);
        }
        u_xlat6 = u_xlat16_10 * vec4(vec4(_FillAmount, _FillAmount, _FillAmount, _FillAmount));
        u_xlat16_6 = (bool(u_xlatb26)) ? u_xlat16_10 : u_xlat6;
    } else {
        u_xlatb13 = 0.949999988<u_xlat3.x;
        u_xlatb3.x = 0.949999988<u_xlat2.x;
        u_xlatb13 = u_xlatb13 || u_xlatb3.x;
        u_xlatb3.x = 0.949999988<u_xlat5.x;
        u_xlatb13 = u_xlatb13 || u_xlatb3.x;
        u_xlatb3.x = 0.949999988<u_xlat4.x;
        u_xlatb13 = u_xlatb13 || u_xlatb3.x;
        if(u_xlatb13){
            u_xlat7 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor1;
            u_xlat7 = u_xlat7 * _LineColor1.wwww;
            u_xlat16_12.x = (-_LineColor1.w) + 1.0;
            u_xlat16_8 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_11 = (bool(u_xlatb39)) ? u_xlat16_8 : u_xlat1;
            u_xlat16_7 = u_xlat7;
            u_xlati0 = -1;
        } else {
            u_xlatb3.xy = lessThan(vec4(0.949999988, 0.949999988, 0.0, 0.0), u_xlat3.yzyy).xy;
            u_xlatb29.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat2.yzyz).xy;
            u_xlati3.xy = op_or((ivec2(u_xlatb29.xy) * -1), (ivec2(u_xlatb3.xy) * -1));
            u_xlatb29.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat5.yzyz).xy;
            u_xlati3.xy = op_or((ivec2(u_xlatb29.xy) * -1), u_xlati3.xy);
            u_xlatb29.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat4.yzyz).xy;
            u_xlat2 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor2;
            u_xlat2 = u_xlat2 * _LineColor2.wwww;
            u_xlat16_12.x = (-_LineColor2.w) + 1.0;
            u_xlat16_4 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_4 = (bool(u_xlatb39)) ? u_xlat16_4 : u_xlat1;
            u_xlati3.xy = op_or((ivec2(u_xlatb29.xy) * -1), u_xlati3.xy);
            u_xlat5 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor3;
            u_xlat5 = u_xlat5 * _LineColor3.wwww;
            u_xlat16_12.x = (-_LineColor3.w) + 1.0;
            u_xlat16_8 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_8 = (bool(u_xlatb39)) ? u_xlat16_8 : u_xlat1;
            u_xlat16_1 = (u_xlati3.y != 0) ? u_xlat16_8 : u_xlat1;
            u_xlat16_5 = (u_xlati3.y != 0) ? u_xlat5 : vec4(0.0, 0.0, 0.0, 0.0);
            u_xlat16_11 = (u_xlati3.x != 0) ? u_xlat16_4 : u_xlat16_1;
            u_xlat16_7 = (u_xlati3.x != 0) ? u_xlat2 : u_xlat16_5;
            u_xlati0 = op_or(u_xlati3.y, u_xlati3.x);
        }
        u_xlat1 = u_xlat16_7 * vec4(vec4(_FillAmount, _FillAmount, _FillAmount, _FillAmount));
        u_xlat16_6 = (bool(u_xlatb26)) ? u_xlat16_7 : u_xlat1;
    }
    if(u_xlati0 != 0) {
        u_xlat16_0 = u_xlat16_6 + u_xlat16_11;
        u_xlat1 = (-u_xlat16_0) + u_xlat16_6;
        u_xlat0 = vec4(vec4(_FillAmount, _FillAmount, _FillAmount, _FillAmount)) * u_xlat1 + u_xlat16_0;
        SV_Target0 = u_xlat0;
        return;
    } else {
        SV_Target0 = u_xlat16_11;
        return;
    }
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
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	float _LineThicknessX;
uniform 	float _LineThicknessY;
uniform 	float _LineIntensity;
uniform 	mediump vec4 _LineColor1;
uniform 	mediump vec4 _LineColor2;
uniform 	mediump vec4 _LineColor3;
uniform 	int _FlipY;
uniform 	int _Dark;
uniform 	float _FillAmount;
uniform 	int _CornerOutlines;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _OutlineSource;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
ivec2 u_xlati3;
bvec2 u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
ivec4 u_xlati6;
bvec4 u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
bvec4 u_xlatb7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
vec4 u_xlat9;
mediump vec4 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
float u_xlat13;
bool u_xlatb13;
bvec2 u_xlatb19;
float u_xlat26;
bool u_xlatb26;
vec2 u_xlat28;
bvec2 u_xlatb29;
vec2 u_xlat30;
bvec2 u_xlatb32;
bool u_xlatb39;
const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_or(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) || (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 || b > 0)) { break; } } return result; }
ivec2 op_or(ivec2 a, ivec2 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); return a; }
ivec3 op_or(ivec3 a, ivec3 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); return a; }
ivec4 op_or(ivec4 a, ivec4 b) { a.x = op_or(a.x, b.x); a.y = op_or(a.y, b.y); a.z = op_or(a.z, b.z); a.w = op_or(a.w, b.w); return a; }

void main()
{
    u_xlatb0 = _FlipY==1;
    u_xlat13 = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat0.y = (u_xlatb0) ? u_xlat13 : vs_TEXCOORD0.y;
    u_xlat1 = texture2D(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlat26 = texture2D(_OutlineSource, u_xlat0.xy).w;
    u_xlat2.x = _LineThicknessX;
    u_xlat2.y = float(0.0);
    u_xlat28.y = float(0.0);
    u_xlat2.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat3.xyz = texture2D(_OutlineSource, u_xlat2.xy).xyz;
    u_xlat28.x = (-_LineThicknessX);
    u_xlat2.xy = u_xlat0.xy + u_xlat28.xy;
    u_xlat2.xyz = texture2D(_OutlineSource, u_xlat2.xy).xyz;
    u_xlat4.x = float(0.0);
    u_xlat30.x = float(0.0);
    u_xlat4.y = _LineThicknessY;
    u_xlat4.xy = u_xlat0.xy + u_xlat4.xy;
    u_xlat5.xyz = texture2D(_OutlineSource, u_xlat4.xy).xyz;
    u_xlat30.y = (-_LineThicknessY);
    u_xlat4.xy = u_xlat0.xy + u_xlat30.xy;
    u_xlat4.xyz = texture2D(_OutlineSource, u_xlat4.xy).xyz;
    u_xlatb26 = u_xlat26<0.949999988;
    u_xlatb39 = _Dark!=0;
    u_xlatb39 = u_xlatb39 && u_xlatb26;
    if(_CornerOutlines != 0) {
        u_xlat6.xy = u_xlat0.xy + vec2(_LineThicknessX, _LineThicknessY);
        u_xlat6.xyz = texture2D(_OutlineSource, u_xlat6.xy).xyz;
        u_xlat7.xy = u_xlat0.xy + (-vec2(_LineThicknessX, _LineThicknessY));
        u_xlat7.xyz = texture2D(_OutlineSource, u_xlat7.xy).xyz;
        u_xlat8 = vec4(_LineThicknessX, _LineThicknessY, _LineThicknessX, _LineThicknessY) * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat0.xyxy;
        u_xlat9.xyz = texture2D(_OutlineSource, u_xlat8.xy).xyz;
        u_xlat8.xyz = texture2D(_OutlineSource, u_xlat8.zw).xyz;
        u_xlatb0 = 0.949999988<u_xlat3.x;
        u_xlatb13 = 0.949999988<u_xlat2.x;
        u_xlatb0 = u_xlatb13 || u_xlatb0;
        u_xlatb13 = 0.949999988<u_xlat5.x;
        u_xlatb0 = u_xlatb13 || u_xlatb0;
        u_xlatb13 = 0.949999988<u_xlat4.x;
        u_xlatb0 = u_xlatb13 || u_xlatb0;
        u_xlatb13 = 0.949999988<u_xlat6.x;
        u_xlatb0 = u_xlatb13 || u_xlatb0;
        u_xlatb13 = 0.949999988<u_xlat7.x;
        u_xlatb0 = u_xlatb13 || u_xlatb0;
        u_xlatb13 = 0.949999988<u_xlat9.x;
        u_xlatb0 = u_xlatb13 || u_xlatb0;
        u_xlatb13 = 0.949999988<u_xlat8.x;
        u_xlatb0 = u_xlatb13 || u_xlatb0;
        if(u_xlatb0){
            u_xlat10 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor1;
            u_xlat10 = u_xlat10 * _LineColor1.wwww;
            u_xlat16_11.x = (-_LineColor1.w) + 1.0;
            u_xlat16_11 = u_xlat1 * u_xlat16_11.xxxx;
            u_xlat16_11 = (bool(u_xlatb39)) ? u_xlat16_11 : u_xlat1;
            u_xlat16_10 = u_xlat10;
            u_xlati0 = -1;
        } else {
            u_xlatb6.xw = lessThan(vec4(0.949999988, 0.0, 0.0, 0.949999988), u_xlat3.yyyz).xw;
            u_xlatb7.xw = lessThan(vec4(0.949999988, 0.0, 0.0, 0.949999988), u_xlat2.yyyz).xw;
            u_xlati6.xw = op_or((ivec2(u_xlatb6.xw) * -1), (ivec2(u_xlatb7.xw) * -1));
            u_xlatb7.xw = lessThan(vec4(0.949999988, 0.0, 0.0, 0.949999988), u_xlat5.yyyz).xw;
            u_xlati6.xw = op_or(u_xlati6.xw, (ivec2(u_xlatb7.xw) * -1));
            u_xlatb7.xw = lessThan(vec4(0.949999988, 0.0, 0.0, 0.949999988), u_xlat4.yyyz).xw;
            u_xlati6.xw = op_or(u_xlati6.xw, (ivec2(u_xlatb7.xw) * -1));
            u_xlatb19.xy = lessThan(vec4(0.949999988, 0.949999988, 0.0, 0.0), u_xlat6.yzyy).xy;
            u_xlati6.xy = op_or((ivec2(u_xlatb19.xy) * -1), u_xlati6.xw);
            u_xlatb32.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat7.yzyz).xy;
            u_xlati6.xy = op_or((ivec2(u_xlatb32.xy) * -1), u_xlati6.xy);
            u_xlatb32.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat9.yzyz).xy;
            u_xlati6.xy = op_or((ivec2(u_xlatb32.xy) * -1), u_xlati6.xy);
            u_xlatb32.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat8.yzyz).xy;
            u_xlat7 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor2;
            u_xlat7 = u_xlat7 * _LineColor2.wwww;
            u_xlat16_12.x = (-_LineColor2.w) + 1.0;
            u_xlat16_8 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_8 = (bool(u_xlatb39)) ? u_xlat16_8 : u_xlat1;
            u_xlati6.xy = op_or((ivec2(u_xlatb32.xy) * -1), u_xlati6.xy);
            u_xlat9 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor3;
            u_xlat9 = u_xlat9 * _LineColor3.wwww;
            u_xlat16_12.x = (-_LineColor3.w) + 1.0;
            u_xlat16_12 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_12 = (bool(u_xlatb39)) ? u_xlat16_12 : u_xlat1;
            u_xlat16_12 = (u_xlati6.y != 0) ? u_xlat16_12 : u_xlat1;
            u_xlat16_9 = (u_xlati6.y != 0) ? u_xlat9 : vec4(0.0, 0.0, 0.0, 0.0);
            u_xlat16_11 = (u_xlati6.x != 0) ? u_xlat16_8 : u_xlat16_12;
            u_xlat16_10 = (u_xlati6.x != 0) ? u_xlat7 : u_xlat16_9;
            u_xlati0 = op_or(u_xlati6.y, u_xlati6.x);
        }
        u_xlat6 = u_xlat16_10 * vec4(vec4(_FillAmount, _FillAmount, _FillAmount, _FillAmount));
        u_xlat16_6 = (bool(u_xlatb26)) ? u_xlat16_10 : u_xlat6;
    } else {
        u_xlatb13 = 0.949999988<u_xlat3.x;
        u_xlatb3.x = 0.949999988<u_xlat2.x;
        u_xlatb13 = u_xlatb13 || u_xlatb3.x;
        u_xlatb3.x = 0.949999988<u_xlat5.x;
        u_xlatb13 = u_xlatb13 || u_xlatb3.x;
        u_xlatb3.x = 0.949999988<u_xlat4.x;
        u_xlatb13 = u_xlatb13 || u_xlatb3.x;
        if(u_xlatb13){
            u_xlat7 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor1;
            u_xlat7 = u_xlat7 * _LineColor1.wwww;
            u_xlat16_12.x = (-_LineColor1.w) + 1.0;
            u_xlat16_8 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_11 = (bool(u_xlatb39)) ? u_xlat16_8 : u_xlat1;
            u_xlat16_7 = u_xlat7;
            u_xlati0 = -1;
        } else {
            u_xlatb3.xy = lessThan(vec4(0.949999988, 0.949999988, 0.0, 0.0), u_xlat3.yzyy).xy;
            u_xlatb29.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat2.yzyz).xy;
            u_xlati3.xy = op_or((ivec2(u_xlatb29.xy) * -1), (ivec2(u_xlatb3.xy) * -1));
            u_xlatb29.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat5.yzyz).xy;
            u_xlati3.xy = op_or((ivec2(u_xlatb29.xy) * -1), u_xlati3.xy);
            u_xlatb29.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat4.yzyz).xy;
            u_xlat2 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor2;
            u_xlat2 = u_xlat2 * _LineColor2.wwww;
            u_xlat16_12.x = (-_LineColor2.w) + 1.0;
            u_xlat16_4 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_4 = (bool(u_xlatb39)) ? u_xlat16_4 : u_xlat1;
            u_xlati3.xy = op_or((ivec2(u_xlatb29.xy) * -1), u_xlati3.xy);
            u_xlat5 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor3;
            u_xlat5 = u_xlat5 * _LineColor3.wwww;
            u_xlat16_12.x = (-_LineColor3.w) + 1.0;
            u_xlat16_8 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_8 = (bool(u_xlatb39)) ? u_xlat16_8 : u_xlat1;
            u_xlat16_1 = (u_xlati3.y != 0) ? u_xlat16_8 : u_xlat1;
            u_xlat16_5 = (u_xlati3.y != 0) ? u_xlat5 : vec4(0.0, 0.0, 0.0, 0.0);
            u_xlat16_11 = (u_xlati3.x != 0) ? u_xlat16_4 : u_xlat16_1;
            u_xlat16_7 = (u_xlati3.x != 0) ? u_xlat2 : u_xlat16_5;
            u_xlati0 = op_or(u_xlati3.y, u_xlati3.x);
        }
        u_xlat1 = u_xlat16_7 * vec4(vec4(_FillAmount, _FillAmount, _FillAmount, _FillAmount));
        u_xlat16_6 = (bool(u_xlatb26)) ? u_xlat16_7 : u_xlat1;
    }
    if(u_xlati0 != 0) {
        u_xlat16_0 = u_xlat16_6 + u_xlat16_11;
        u_xlat1 = (-u_xlat16_0) + u_xlat16_6;
        u_xlat0 = vec4(vec4(_FillAmount, _FillAmount, _FillAmount, _FillAmount)) * u_xlat1 + u_xlat16_0;
        SV_Target0 = u_xlat0;
        return;
    } else {
        SV_Target0 = u_xlat16_11;
        return;
    }
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	float _LineThicknessX;
uniform 	float _LineThicknessY;
uniform 	float _LineIntensity;
uniform 	mediump vec4 _LineColor1;
uniform 	mediump vec4 _LineColor2;
uniform 	mediump vec4 _LineColor3;
uniform 	int _FlipY;
uniform 	int _Dark;
uniform 	float _FillAmount;
uniform 	int _CornerOutlines;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _OutlineSource;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
ivec2 u_xlati3;
bvec2 u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
ivec4 u_xlati6;
bvec4 u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
bvec4 u_xlatb7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
vec4 u_xlat9;
mediump vec4 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
float u_xlat13;
bool u_xlatb13;
bvec2 u_xlatb19;
float u_xlat26;
bool u_xlatb26;
vec2 u_xlat28;
bvec2 u_xlatb29;
vec2 u_xlat30;
bvec2 u_xlatb32;
bool u_xlatb39;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_FlipY==1);
#else
    u_xlatb0 = _FlipY==1;
#endif
    u_xlat13 = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat0.y = (u_xlatb0) ? u_xlat13 : vs_TEXCOORD0.y;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlat26 = texture(_OutlineSource, u_xlat0.xy).w;
    u_xlat2.x = _LineThicknessX;
    u_xlat2.y = float(0.0);
    u_xlat28.y = float(0.0);
    u_xlat2.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat3.xyz = texture(_OutlineSource, u_xlat2.xy).xyz;
    u_xlat28.x = (-_LineThicknessX);
    u_xlat2.xy = u_xlat0.xy + u_xlat28.xy;
    u_xlat2.xyz = texture(_OutlineSource, u_xlat2.xy).xyz;
    u_xlat4.x = float(0.0);
    u_xlat30.x = float(0.0);
    u_xlat4.y = _LineThicknessY;
    u_xlat4.xy = u_xlat0.xy + u_xlat4.xy;
    u_xlat5.xyz = texture(_OutlineSource, u_xlat4.xy).xyz;
    u_xlat30.y = (-_LineThicknessY);
    u_xlat4.xy = u_xlat0.xy + u_xlat30.xy;
    u_xlat4.xyz = texture(_OutlineSource, u_xlat4.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(u_xlat26<0.949999988);
#else
    u_xlatb26 = u_xlat26<0.949999988;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(_Dark!=0);
#else
    u_xlatb39 = _Dark!=0;
#endif
    u_xlatb39 = u_xlatb39 && u_xlatb26;
    if(_CornerOutlines != 0) {
        u_xlat6.xy = u_xlat0.xy + vec2(_LineThicknessX, _LineThicknessY);
        u_xlat6.xyz = texture(_OutlineSource, u_xlat6.xy).xyz;
        u_xlat7.xy = u_xlat0.xy + (-vec2(_LineThicknessX, _LineThicknessY));
        u_xlat7.xyz = texture(_OutlineSource, u_xlat7.xy).xyz;
        u_xlat8 = vec4(_LineThicknessX, _LineThicknessY, _LineThicknessX, _LineThicknessY) * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat0.xyxy;
        u_xlat9.xyz = texture(_OutlineSource, u_xlat8.xy).xyz;
        u_xlat8.xyz = texture(_OutlineSource, u_xlat8.zw).xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(0.949999988<u_xlat3.x);
#else
        u_xlatb0 = 0.949999988<u_xlat3.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(0.949999988<u_xlat2.x);
#else
        u_xlatb13 = 0.949999988<u_xlat2.x;
#endif
        u_xlatb0 = u_xlatb13 || u_xlatb0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(0.949999988<u_xlat5.x);
#else
        u_xlatb13 = 0.949999988<u_xlat5.x;
#endif
        u_xlatb0 = u_xlatb13 || u_xlatb0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(0.949999988<u_xlat4.x);
#else
        u_xlatb13 = 0.949999988<u_xlat4.x;
#endif
        u_xlatb0 = u_xlatb13 || u_xlatb0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(0.949999988<u_xlat6.x);
#else
        u_xlatb13 = 0.949999988<u_xlat6.x;
#endif
        u_xlatb0 = u_xlatb13 || u_xlatb0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(0.949999988<u_xlat7.x);
#else
        u_xlatb13 = 0.949999988<u_xlat7.x;
#endif
        u_xlatb0 = u_xlatb13 || u_xlatb0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(0.949999988<u_xlat9.x);
#else
        u_xlatb13 = 0.949999988<u_xlat9.x;
#endif
        u_xlatb0 = u_xlatb13 || u_xlatb0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(0.949999988<u_xlat8.x);
#else
        u_xlatb13 = 0.949999988<u_xlat8.x;
#endif
        u_xlatb0 = u_xlatb13 || u_xlatb0;
        if(u_xlatb0){
            u_xlat10 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor1;
            u_xlat10 = u_xlat10 * _LineColor1.wwww;
            u_xlat16_11.x = (-_LineColor1.w) + 1.0;
            u_xlat16_11 = u_xlat1 * u_xlat16_11.xxxx;
            u_xlat16_11 = (bool(u_xlatb39)) ? u_xlat16_11 : u_xlat1;
            u_xlat16_10 = u_xlat10;
            u_xlati0 = int(0xFFFFFFFFu);
        } else {
            u_xlatb6.xw = lessThan(vec4(0.949999988, 0.0, 0.0, 0.949999988), u_xlat3.yyyz).xw;
            u_xlatb7.xw = lessThan(vec4(0.949999988, 0.0, 0.0, 0.949999988), u_xlat2.yyyz).xw;
            u_xlati6.xw = ivec2(uvec2((uint(u_xlatb6.x) * 0xffffffffu) | (uint(u_xlatb7.x) * 0xffffffffu), (uint(u_xlatb6.w) * 0xffffffffu) | (uint(u_xlatb7.w) * 0xffffffffu)));
            u_xlatb7.xw = lessThan(vec4(0.949999988, 0.0, 0.0, 0.949999988), u_xlat5.yyyz).xw;
            u_xlati6.xw = ivec2(uvec2(uint(u_xlati6.x) | (uint(u_xlatb7.x) * 0xffffffffu), uint(u_xlati6.w) | (uint(u_xlatb7.w) * 0xffffffffu)));
            u_xlatb7.xw = lessThan(vec4(0.949999988, 0.0, 0.0, 0.949999988), u_xlat4.yyyz).xw;
            u_xlati6.xw = ivec2(uvec2(uint(u_xlati6.x) | (uint(u_xlatb7.x) * 0xffffffffu), uint(u_xlati6.w) | (uint(u_xlatb7.w) * 0xffffffffu)));
            u_xlatb19.xy = lessThan(vec4(0.949999988, 0.949999988, 0.0, 0.0), u_xlat6.yzyy).xy;
            u_xlati6.xy = ivec2(uvec2((uint(u_xlatb19.x) * 0xffffffffu) | uint(u_xlati6.x), (uint(u_xlatb19.y) * 0xffffffffu) | uint(u_xlati6.w)));
            u_xlatb32.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat7.yzyz).xy;
            u_xlati6.xy = ivec2(uvec2((uint(u_xlatb32.x) * 0xffffffffu) | uint(u_xlati6.x), (uint(u_xlatb32.y) * 0xffffffffu) | uint(u_xlati6.y)));
            u_xlatb32.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat9.yzyz).xy;
            u_xlati6.xy = ivec2(uvec2((uint(u_xlatb32.x) * 0xffffffffu) | uint(u_xlati6.x), (uint(u_xlatb32.y) * 0xffffffffu) | uint(u_xlati6.y)));
            u_xlatb32.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat8.yzyz).xy;
            u_xlat7 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor2;
            u_xlat7 = u_xlat7 * _LineColor2.wwww;
            u_xlat16_12.x = (-_LineColor2.w) + 1.0;
            u_xlat16_8 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_8 = (bool(u_xlatb39)) ? u_xlat16_8 : u_xlat1;
            u_xlati6.xy = ivec2(uvec2((uint(u_xlatb32.x) * 0xffffffffu) | uint(u_xlati6.x), (uint(u_xlatb32.y) * 0xffffffffu) | uint(u_xlati6.y)));
            u_xlat9 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor3;
            u_xlat9 = u_xlat9 * _LineColor3.wwww;
            u_xlat16_12.x = (-_LineColor3.w) + 1.0;
            u_xlat16_12 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_12 = (bool(u_xlatb39)) ? u_xlat16_12 : u_xlat1;
            u_xlat16_12 = (u_xlati6.y != 0) ? u_xlat16_12 : u_xlat1;
            u_xlat16_9 = (u_xlati6.y != 0) ? u_xlat9 : vec4(0.0, 0.0, 0.0, 0.0);
            u_xlat16_11 = (u_xlati6.x != 0) ? u_xlat16_8 : u_xlat16_12;
            u_xlat16_10 = (u_xlati6.x != 0) ? u_xlat7 : u_xlat16_9;
            u_xlati0 = int(uint(uint(u_xlati6.y) | uint(u_xlati6.x)));
        }
        u_xlat6 = u_xlat16_10 * vec4(vec4(_FillAmount, _FillAmount, _FillAmount, _FillAmount));
        u_xlat16_6 = (bool(u_xlatb26)) ? u_xlat16_10 : u_xlat6;
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(0.949999988<u_xlat3.x);
#else
        u_xlatb13 = 0.949999988<u_xlat3.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(0.949999988<u_xlat2.x);
#else
        u_xlatb3.x = 0.949999988<u_xlat2.x;
#endif
        u_xlatb13 = u_xlatb13 || u_xlatb3.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(0.949999988<u_xlat5.x);
#else
        u_xlatb3.x = 0.949999988<u_xlat5.x;
#endif
        u_xlatb13 = u_xlatb13 || u_xlatb3.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(0.949999988<u_xlat4.x);
#else
        u_xlatb3.x = 0.949999988<u_xlat4.x;
#endif
        u_xlatb13 = u_xlatb13 || u_xlatb3.x;
        if(u_xlatb13){
            u_xlat7 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor1;
            u_xlat7 = u_xlat7 * _LineColor1.wwww;
            u_xlat16_12.x = (-_LineColor1.w) + 1.0;
            u_xlat16_8 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_11 = (bool(u_xlatb39)) ? u_xlat16_8 : u_xlat1;
            u_xlat16_7 = u_xlat7;
            u_xlati0 = int(0xFFFFFFFFu);
        } else {
            u_xlatb3.xy = lessThan(vec4(0.949999988, 0.949999988, 0.0, 0.0), u_xlat3.yzyy).xy;
            u_xlatb29.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat2.yzyz).xy;
            u_xlati3.xy = ivec2(uvec2((uint(u_xlatb29.x) * 0xffffffffu) | (uint(u_xlatb3.x) * 0xffffffffu), (uint(u_xlatb29.y) * 0xffffffffu) | (uint(u_xlatb3.y) * 0xffffffffu)));
            u_xlatb29.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat5.yzyz).xy;
            u_xlati3.xy = ivec2(uvec2((uint(u_xlatb29.x) * 0xffffffffu) | uint(u_xlati3.x), (uint(u_xlatb29.y) * 0xffffffffu) | uint(u_xlati3.y)));
            u_xlatb29.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat4.yzyz).xy;
            u_xlat2 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor2;
            u_xlat2 = u_xlat2 * _LineColor2.wwww;
            u_xlat16_12.x = (-_LineColor2.w) + 1.0;
            u_xlat16_4 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_4 = (bool(u_xlatb39)) ? u_xlat16_4 : u_xlat1;
            u_xlati3.xy = ivec2(uvec2((uint(u_xlatb29.x) * 0xffffffffu) | uint(u_xlati3.x), (uint(u_xlatb29.y) * 0xffffffffu) | uint(u_xlati3.y)));
            u_xlat5 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor3;
            u_xlat5 = u_xlat5 * _LineColor3.wwww;
            u_xlat16_12.x = (-_LineColor3.w) + 1.0;
            u_xlat16_8 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_8 = (bool(u_xlatb39)) ? u_xlat16_8 : u_xlat1;
            u_xlat16_1 = (u_xlati3.y != 0) ? u_xlat16_8 : u_xlat1;
            u_xlat16_5 = (u_xlati3.y != 0) ? u_xlat5 : vec4(0.0, 0.0, 0.0, 0.0);
            u_xlat16_11 = (u_xlati3.x != 0) ? u_xlat16_4 : u_xlat16_1;
            u_xlat16_7 = (u_xlati3.x != 0) ? u_xlat2 : u_xlat16_5;
            u_xlati0 = int(uint(uint(u_xlati3.y) | uint(u_xlati3.x)));
        }
        u_xlat1 = u_xlat16_7 * vec4(vec4(_FillAmount, _FillAmount, _FillAmount, _FillAmount));
        u_xlat16_6 = (bool(u_xlatb26)) ? u_xlat16_7 : u_xlat1;
    }
    if(u_xlati0 != 0) {
        u_xlat16_0 = u_xlat16_6 + u_xlat16_11;
        u_xlat1 = (-u_xlat16_0) + u_xlat16_6;
        u_xlat0 = vec4(vec4(_FillAmount, _FillAmount, _FillAmount, _FillAmount)) * u_xlat1 + u_xlat16_0;
        SV_Target0 = u_xlat0;
        return;
    } else {
        SV_Target0 = u_xlat16_11;
        return;
    }
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	float _LineThicknessX;
uniform 	float _LineThicknessY;
uniform 	float _LineIntensity;
uniform 	mediump vec4 _LineColor1;
uniform 	mediump vec4 _LineColor2;
uniform 	mediump vec4 _LineColor3;
uniform 	int _FlipY;
uniform 	int _Dark;
uniform 	float _FillAmount;
uniform 	int _CornerOutlines;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _OutlineSource;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
ivec2 u_xlati3;
bvec2 u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
ivec4 u_xlati6;
bvec4 u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
bvec4 u_xlatb7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
vec4 u_xlat9;
mediump vec4 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
float u_xlat13;
bool u_xlatb13;
bvec2 u_xlatb19;
float u_xlat26;
bool u_xlatb26;
vec2 u_xlat28;
bvec2 u_xlatb29;
vec2 u_xlat30;
bvec2 u_xlatb32;
bool u_xlatb39;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_FlipY==1);
#else
    u_xlatb0 = _FlipY==1;
#endif
    u_xlat13 = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat0.y = (u_xlatb0) ? u_xlat13 : vs_TEXCOORD0.y;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlat26 = texture(_OutlineSource, u_xlat0.xy).w;
    u_xlat2.x = _LineThicknessX;
    u_xlat2.y = float(0.0);
    u_xlat28.y = float(0.0);
    u_xlat2.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat3.xyz = texture(_OutlineSource, u_xlat2.xy).xyz;
    u_xlat28.x = (-_LineThicknessX);
    u_xlat2.xy = u_xlat0.xy + u_xlat28.xy;
    u_xlat2.xyz = texture(_OutlineSource, u_xlat2.xy).xyz;
    u_xlat4.x = float(0.0);
    u_xlat30.x = float(0.0);
    u_xlat4.y = _LineThicknessY;
    u_xlat4.xy = u_xlat0.xy + u_xlat4.xy;
    u_xlat5.xyz = texture(_OutlineSource, u_xlat4.xy).xyz;
    u_xlat30.y = (-_LineThicknessY);
    u_xlat4.xy = u_xlat0.xy + u_xlat30.xy;
    u_xlat4.xyz = texture(_OutlineSource, u_xlat4.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(u_xlat26<0.949999988);
#else
    u_xlatb26 = u_xlat26<0.949999988;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(_Dark!=0);
#else
    u_xlatb39 = _Dark!=0;
#endif
    u_xlatb39 = u_xlatb39 && u_xlatb26;
    if(_CornerOutlines != 0) {
        u_xlat6.xy = u_xlat0.xy + vec2(_LineThicknessX, _LineThicknessY);
        u_xlat6.xyz = texture(_OutlineSource, u_xlat6.xy).xyz;
        u_xlat7.xy = u_xlat0.xy + (-vec2(_LineThicknessX, _LineThicknessY));
        u_xlat7.xyz = texture(_OutlineSource, u_xlat7.xy).xyz;
        u_xlat8 = vec4(_LineThicknessX, _LineThicknessY, _LineThicknessX, _LineThicknessY) * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat0.xyxy;
        u_xlat9.xyz = texture(_OutlineSource, u_xlat8.xy).xyz;
        u_xlat8.xyz = texture(_OutlineSource, u_xlat8.zw).xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(0.949999988<u_xlat3.x);
#else
        u_xlatb0 = 0.949999988<u_xlat3.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(0.949999988<u_xlat2.x);
#else
        u_xlatb13 = 0.949999988<u_xlat2.x;
#endif
        u_xlatb0 = u_xlatb13 || u_xlatb0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(0.949999988<u_xlat5.x);
#else
        u_xlatb13 = 0.949999988<u_xlat5.x;
#endif
        u_xlatb0 = u_xlatb13 || u_xlatb0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(0.949999988<u_xlat4.x);
#else
        u_xlatb13 = 0.949999988<u_xlat4.x;
#endif
        u_xlatb0 = u_xlatb13 || u_xlatb0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(0.949999988<u_xlat6.x);
#else
        u_xlatb13 = 0.949999988<u_xlat6.x;
#endif
        u_xlatb0 = u_xlatb13 || u_xlatb0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(0.949999988<u_xlat7.x);
#else
        u_xlatb13 = 0.949999988<u_xlat7.x;
#endif
        u_xlatb0 = u_xlatb13 || u_xlatb0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(0.949999988<u_xlat9.x);
#else
        u_xlatb13 = 0.949999988<u_xlat9.x;
#endif
        u_xlatb0 = u_xlatb13 || u_xlatb0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(0.949999988<u_xlat8.x);
#else
        u_xlatb13 = 0.949999988<u_xlat8.x;
#endif
        u_xlatb0 = u_xlatb13 || u_xlatb0;
        if(u_xlatb0){
            u_xlat10 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor1;
            u_xlat10 = u_xlat10 * _LineColor1.wwww;
            u_xlat16_11.x = (-_LineColor1.w) + 1.0;
            u_xlat16_11 = u_xlat1 * u_xlat16_11.xxxx;
            u_xlat16_11 = (bool(u_xlatb39)) ? u_xlat16_11 : u_xlat1;
            u_xlat16_10 = u_xlat10;
            u_xlati0 = int(0xFFFFFFFFu);
        } else {
            u_xlatb6.xw = lessThan(vec4(0.949999988, 0.0, 0.0, 0.949999988), u_xlat3.yyyz).xw;
            u_xlatb7.xw = lessThan(vec4(0.949999988, 0.0, 0.0, 0.949999988), u_xlat2.yyyz).xw;
            u_xlati6.xw = ivec2(uvec2((uint(u_xlatb6.x) * 0xffffffffu) | (uint(u_xlatb7.x) * 0xffffffffu), (uint(u_xlatb6.w) * 0xffffffffu) | (uint(u_xlatb7.w) * 0xffffffffu)));
            u_xlatb7.xw = lessThan(vec4(0.949999988, 0.0, 0.0, 0.949999988), u_xlat5.yyyz).xw;
            u_xlati6.xw = ivec2(uvec2(uint(u_xlati6.x) | (uint(u_xlatb7.x) * 0xffffffffu), uint(u_xlati6.w) | (uint(u_xlatb7.w) * 0xffffffffu)));
            u_xlatb7.xw = lessThan(vec4(0.949999988, 0.0, 0.0, 0.949999988), u_xlat4.yyyz).xw;
            u_xlati6.xw = ivec2(uvec2(uint(u_xlati6.x) | (uint(u_xlatb7.x) * 0xffffffffu), uint(u_xlati6.w) | (uint(u_xlatb7.w) * 0xffffffffu)));
            u_xlatb19.xy = lessThan(vec4(0.949999988, 0.949999988, 0.0, 0.0), u_xlat6.yzyy).xy;
            u_xlati6.xy = ivec2(uvec2((uint(u_xlatb19.x) * 0xffffffffu) | uint(u_xlati6.x), (uint(u_xlatb19.y) * 0xffffffffu) | uint(u_xlati6.w)));
            u_xlatb32.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat7.yzyz).xy;
            u_xlati6.xy = ivec2(uvec2((uint(u_xlatb32.x) * 0xffffffffu) | uint(u_xlati6.x), (uint(u_xlatb32.y) * 0xffffffffu) | uint(u_xlati6.y)));
            u_xlatb32.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat9.yzyz).xy;
            u_xlati6.xy = ivec2(uvec2((uint(u_xlatb32.x) * 0xffffffffu) | uint(u_xlati6.x), (uint(u_xlatb32.y) * 0xffffffffu) | uint(u_xlati6.y)));
            u_xlatb32.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat8.yzyz).xy;
            u_xlat7 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor2;
            u_xlat7 = u_xlat7 * _LineColor2.wwww;
            u_xlat16_12.x = (-_LineColor2.w) + 1.0;
            u_xlat16_8 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_8 = (bool(u_xlatb39)) ? u_xlat16_8 : u_xlat1;
            u_xlati6.xy = ivec2(uvec2((uint(u_xlatb32.x) * 0xffffffffu) | uint(u_xlati6.x), (uint(u_xlatb32.y) * 0xffffffffu) | uint(u_xlati6.y)));
            u_xlat9 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor3;
            u_xlat9 = u_xlat9 * _LineColor3.wwww;
            u_xlat16_12.x = (-_LineColor3.w) + 1.0;
            u_xlat16_12 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_12 = (bool(u_xlatb39)) ? u_xlat16_12 : u_xlat1;
            u_xlat16_12 = (u_xlati6.y != 0) ? u_xlat16_12 : u_xlat1;
            u_xlat16_9 = (u_xlati6.y != 0) ? u_xlat9 : vec4(0.0, 0.0, 0.0, 0.0);
            u_xlat16_11 = (u_xlati6.x != 0) ? u_xlat16_8 : u_xlat16_12;
            u_xlat16_10 = (u_xlati6.x != 0) ? u_xlat7 : u_xlat16_9;
            u_xlati0 = int(uint(uint(u_xlati6.y) | uint(u_xlati6.x)));
        }
        u_xlat6 = u_xlat16_10 * vec4(vec4(_FillAmount, _FillAmount, _FillAmount, _FillAmount));
        u_xlat16_6 = (bool(u_xlatb26)) ? u_xlat16_10 : u_xlat6;
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(0.949999988<u_xlat3.x);
#else
        u_xlatb13 = 0.949999988<u_xlat3.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(0.949999988<u_xlat2.x);
#else
        u_xlatb3.x = 0.949999988<u_xlat2.x;
#endif
        u_xlatb13 = u_xlatb13 || u_xlatb3.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(0.949999988<u_xlat5.x);
#else
        u_xlatb3.x = 0.949999988<u_xlat5.x;
#endif
        u_xlatb13 = u_xlatb13 || u_xlatb3.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(0.949999988<u_xlat4.x);
#else
        u_xlatb3.x = 0.949999988<u_xlat4.x;
#endif
        u_xlatb13 = u_xlatb13 || u_xlatb3.x;
        if(u_xlatb13){
            u_xlat7 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor1;
            u_xlat7 = u_xlat7 * _LineColor1.wwww;
            u_xlat16_12.x = (-_LineColor1.w) + 1.0;
            u_xlat16_8 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_11 = (bool(u_xlatb39)) ? u_xlat16_8 : u_xlat1;
            u_xlat16_7 = u_xlat7;
            u_xlati0 = int(0xFFFFFFFFu);
        } else {
            u_xlatb3.xy = lessThan(vec4(0.949999988, 0.949999988, 0.0, 0.0), u_xlat3.yzyy).xy;
            u_xlatb29.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat2.yzyz).xy;
            u_xlati3.xy = ivec2(uvec2((uint(u_xlatb29.x) * 0xffffffffu) | (uint(u_xlatb3.x) * 0xffffffffu), (uint(u_xlatb29.y) * 0xffffffffu) | (uint(u_xlatb3.y) * 0xffffffffu)));
            u_xlatb29.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat5.yzyz).xy;
            u_xlati3.xy = ivec2(uvec2((uint(u_xlatb29.x) * 0xffffffffu) | uint(u_xlati3.x), (uint(u_xlatb29.y) * 0xffffffffu) | uint(u_xlati3.y)));
            u_xlatb29.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat4.yzyz).xy;
            u_xlat2 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor2;
            u_xlat2 = u_xlat2 * _LineColor2.wwww;
            u_xlat16_12.x = (-_LineColor2.w) + 1.0;
            u_xlat16_4 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_4 = (bool(u_xlatb39)) ? u_xlat16_4 : u_xlat1;
            u_xlati3.xy = ivec2(uvec2((uint(u_xlatb29.x) * 0xffffffffu) | uint(u_xlati3.x), (uint(u_xlatb29.y) * 0xffffffffu) | uint(u_xlati3.y)));
            u_xlat5 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor3;
            u_xlat5 = u_xlat5 * _LineColor3.wwww;
            u_xlat16_12.x = (-_LineColor3.w) + 1.0;
            u_xlat16_8 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_8 = (bool(u_xlatb39)) ? u_xlat16_8 : u_xlat1;
            u_xlat16_1 = (u_xlati3.y != 0) ? u_xlat16_8 : u_xlat1;
            u_xlat16_5 = (u_xlati3.y != 0) ? u_xlat5 : vec4(0.0, 0.0, 0.0, 0.0);
            u_xlat16_11 = (u_xlati3.x != 0) ? u_xlat16_4 : u_xlat16_1;
            u_xlat16_7 = (u_xlati3.x != 0) ? u_xlat2 : u_xlat16_5;
            u_xlati0 = int(uint(uint(u_xlati3.y) | uint(u_xlati3.x)));
        }
        u_xlat1 = u_xlat16_7 * vec4(vec4(_FillAmount, _FillAmount, _FillAmount, _FillAmount));
        u_xlat16_6 = (bool(u_xlatb26)) ? u_xlat16_7 : u_xlat1;
    }
    if(u_xlati0 != 0) {
        u_xlat16_0 = u_xlat16_6 + u_xlat16_11;
        u_xlat1 = (-u_xlat16_0) + u_xlat16_6;
        u_xlat0 = vec4(vec4(_FillAmount, _FillAmount, _FillAmount, _FillAmount)) * u_xlat1 + u_xlat16_0;
        SV_Target0 = u_xlat0;
        return;
    } else {
        SV_Target0 = u_xlat16_11;
        return;
    }
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	float _LineThicknessX;
uniform 	float _LineThicknessY;
uniform 	float _LineIntensity;
uniform 	mediump vec4 _LineColor1;
uniform 	mediump vec4 _LineColor2;
uniform 	mediump vec4 _LineColor3;
uniform 	int _FlipY;
uniform 	int _Dark;
uniform 	float _FillAmount;
uniform 	int _CornerOutlines;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _OutlineSource;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
vec3 u_xlat3;
ivec2 u_xlati3;
bvec2 u_xlatb3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
mediump vec4 u_xlat16_5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
ivec4 u_xlati6;
bvec4 u_xlatb6;
vec4 u_xlat7;
mediump vec4 u_xlat16_7;
bvec4 u_xlatb7;
vec4 u_xlat8;
mediump vec4 u_xlat16_8;
vec4 u_xlat9;
mediump vec4 u_xlat16_9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
mediump vec4 u_xlat16_11;
mediump vec4 u_xlat16_12;
float u_xlat13;
bool u_xlatb13;
bvec2 u_xlatb19;
float u_xlat26;
bool u_xlatb26;
vec2 u_xlat28;
bvec2 u_xlatb29;
vec2 u_xlat30;
bvec2 u_xlatb32;
bool u_xlatb39;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_FlipY==1);
#else
    u_xlatb0 = _FlipY==1;
#endif
    u_xlat13 = (-vs_TEXCOORD0.y) + 1.0;
    u_xlat0.y = (u_xlatb0) ? u_xlat13 : vs_TEXCOORD0.y;
    u_xlat1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlat26 = texture(_OutlineSource, u_xlat0.xy).w;
    u_xlat2.x = _LineThicknessX;
    u_xlat2.y = float(0.0);
    u_xlat28.y = float(0.0);
    u_xlat2.xy = u_xlat0.xy + u_xlat2.xy;
    u_xlat3.xyz = texture(_OutlineSource, u_xlat2.xy).xyz;
    u_xlat28.x = (-_LineThicknessX);
    u_xlat2.xy = u_xlat0.xy + u_xlat28.xy;
    u_xlat2.xyz = texture(_OutlineSource, u_xlat2.xy).xyz;
    u_xlat4.x = float(0.0);
    u_xlat30.x = float(0.0);
    u_xlat4.y = _LineThicknessY;
    u_xlat4.xy = u_xlat0.xy + u_xlat4.xy;
    u_xlat5.xyz = texture(_OutlineSource, u_xlat4.xy).xyz;
    u_xlat30.y = (-_LineThicknessY);
    u_xlat4.xy = u_xlat0.xy + u_xlat30.xy;
    u_xlat4.xyz = texture(_OutlineSource, u_xlat4.xy).xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(u_xlat26<0.949999988);
#else
    u_xlatb26 = u_xlat26<0.949999988;
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb39 = !!(_Dark!=0);
#else
    u_xlatb39 = _Dark!=0;
#endif
    u_xlatb39 = u_xlatb39 && u_xlatb26;
    if(_CornerOutlines != 0) {
        u_xlat6.xy = u_xlat0.xy + vec2(_LineThicknessX, _LineThicknessY);
        u_xlat6.xyz = texture(_OutlineSource, u_xlat6.xy).xyz;
        u_xlat7.xy = u_xlat0.xy + (-vec2(_LineThicknessX, _LineThicknessY));
        u_xlat7.xyz = texture(_OutlineSource, u_xlat7.xy).xyz;
        u_xlat8 = vec4(_LineThicknessX, _LineThicknessY, _LineThicknessX, _LineThicknessY) * vec4(1.0, -1.0, -1.0, 1.0) + u_xlat0.xyxy;
        u_xlat9.xyz = texture(_OutlineSource, u_xlat8.xy).xyz;
        u_xlat8.xyz = texture(_OutlineSource, u_xlat8.zw).xyz;
#ifdef UNITY_ADRENO_ES3
        u_xlatb0 = !!(0.949999988<u_xlat3.x);
#else
        u_xlatb0 = 0.949999988<u_xlat3.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(0.949999988<u_xlat2.x);
#else
        u_xlatb13 = 0.949999988<u_xlat2.x;
#endif
        u_xlatb0 = u_xlatb13 || u_xlatb0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(0.949999988<u_xlat5.x);
#else
        u_xlatb13 = 0.949999988<u_xlat5.x;
#endif
        u_xlatb0 = u_xlatb13 || u_xlatb0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(0.949999988<u_xlat4.x);
#else
        u_xlatb13 = 0.949999988<u_xlat4.x;
#endif
        u_xlatb0 = u_xlatb13 || u_xlatb0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(0.949999988<u_xlat6.x);
#else
        u_xlatb13 = 0.949999988<u_xlat6.x;
#endif
        u_xlatb0 = u_xlatb13 || u_xlatb0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(0.949999988<u_xlat7.x);
#else
        u_xlatb13 = 0.949999988<u_xlat7.x;
#endif
        u_xlatb0 = u_xlatb13 || u_xlatb0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(0.949999988<u_xlat9.x);
#else
        u_xlatb13 = 0.949999988<u_xlat9.x;
#endif
        u_xlatb0 = u_xlatb13 || u_xlatb0;
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(0.949999988<u_xlat8.x);
#else
        u_xlatb13 = 0.949999988<u_xlat8.x;
#endif
        u_xlatb0 = u_xlatb13 || u_xlatb0;
        if(u_xlatb0){
            u_xlat10 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor1;
            u_xlat10 = u_xlat10 * _LineColor1.wwww;
            u_xlat16_11.x = (-_LineColor1.w) + 1.0;
            u_xlat16_11 = u_xlat1 * u_xlat16_11.xxxx;
            u_xlat16_11 = (bool(u_xlatb39)) ? u_xlat16_11 : u_xlat1;
            u_xlat16_10 = u_xlat10;
            u_xlati0 = int(0xFFFFFFFFu);
        } else {
            u_xlatb6.xw = lessThan(vec4(0.949999988, 0.0, 0.0, 0.949999988), u_xlat3.yyyz).xw;
            u_xlatb7.xw = lessThan(vec4(0.949999988, 0.0, 0.0, 0.949999988), u_xlat2.yyyz).xw;
            u_xlati6.xw = ivec2(uvec2((uint(u_xlatb6.x) * 0xffffffffu) | (uint(u_xlatb7.x) * 0xffffffffu), (uint(u_xlatb6.w) * 0xffffffffu) | (uint(u_xlatb7.w) * 0xffffffffu)));
            u_xlatb7.xw = lessThan(vec4(0.949999988, 0.0, 0.0, 0.949999988), u_xlat5.yyyz).xw;
            u_xlati6.xw = ivec2(uvec2(uint(u_xlati6.x) | (uint(u_xlatb7.x) * 0xffffffffu), uint(u_xlati6.w) | (uint(u_xlatb7.w) * 0xffffffffu)));
            u_xlatb7.xw = lessThan(vec4(0.949999988, 0.0, 0.0, 0.949999988), u_xlat4.yyyz).xw;
            u_xlati6.xw = ivec2(uvec2(uint(u_xlati6.x) | (uint(u_xlatb7.x) * 0xffffffffu), uint(u_xlati6.w) | (uint(u_xlatb7.w) * 0xffffffffu)));
            u_xlatb19.xy = lessThan(vec4(0.949999988, 0.949999988, 0.0, 0.0), u_xlat6.yzyy).xy;
            u_xlati6.xy = ivec2(uvec2((uint(u_xlatb19.x) * 0xffffffffu) | uint(u_xlati6.x), (uint(u_xlatb19.y) * 0xffffffffu) | uint(u_xlati6.w)));
            u_xlatb32.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat7.yzyz).xy;
            u_xlati6.xy = ivec2(uvec2((uint(u_xlatb32.x) * 0xffffffffu) | uint(u_xlati6.x), (uint(u_xlatb32.y) * 0xffffffffu) | uint(u_xlati6.y)));
            u_xlatb32.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat9.yzyz).xy;
            u_xlati6.xy = ivec2(uvec2((uint(u_xlatb32.x) * 0xffffffffu) | uint(u_xlati6.x), (uint(u_xlatb32.y) * 0xffffffffu) | uint(u_xlati6.y)));
            u_xlatb32.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat8.yzyz).xy;
            u_xlat7 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor2;
            u_xlat7 = u_xlat7 * _LineColor2.wwww;
            u_xlat16_12.x = (-_LineColor2.w) + 1.0;
            u_xlat16_8 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_8 = (bool(u_xlatb39)) ? u_xlat16_8 : u_xlat1;
            u_xlati6.xy = ivec2(uvec2((uint(u_xlatb32.x) * 0xffffffffu) | uint(u_xlati6.x), (uint(u_xlatb32.y) * 0xffffffffu) | uint(u_xlati6.y)));
            u_xlat9 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor3;
            u_xlat9 = u_xlat9 * _LineColor3.wwww;
            u_xlat16_12.x = (-_LineColor3.w) + 1.0;
            u_xlat16_12 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_12 = (bool(u_xlatb39)) ? u_xlat16_12 : u_xlat1;
            u_xlat16_12 = (u_xlati6.y != 0) ? u_xlat16_12 : u_xlat1;
            u_xlat16_9 = (u_xlati6.y != 0) ? u_xlat9 : vec4(0.0, 0.0, 0.0, 0.0);
            u_xlat16_11 = (u_xlati6.x != 0) ? u_xlat16_8 : u_xlat16_12;
            u_xlat16_10 = (u_xlati6.x != 0) ? u_xlat7 : u_xlat16_9;
            u_xlati0 = int(uint(uint(u_xlati6.y) | uint(u_xlati6.x)));
        }
        u_xlat6 = u_xlat16_10 * vec4(vec4(_FillAmount, _FillAmount, _FillAmount, _FillAmount));
        u_xlat16_6 = (bool(u_xlatb26)) ? u_xlat16_10 : u_xlat6;
    } else {
#ifdef UNITY_ADRENO_ES3
        u_xlatb13 = !!(0.949999988<u_xlat3.x);
#else
        u_xlatb13 = 0.949999988<u_xlat3.x;
#endif
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(0.949999988<u_xlat2.x);
#else
        u_xlatb3.x = 0.949999988<u_xlat2.x;
#endif
        u_xlatb13 = u_xlatb13 || u_xlatb3.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(0.949999988<u_xlat5.x);
#else
        u_xlatb3.x = 0.949999988<u_xlat5.x;
#endif
        u_xlatb13 = u_xlatb13 || u_xlatb3.x;
#ifdef UNITY_ADRENO_ES3
        u_xlatb3.x = !!(0.949999988<u_xlat4.x);
#else
        u_xlatb3.x = 0.949999988<u_xlat4.x;
#endif
        u_xlatb13 = u_xlatb13 || u_xlatb3.x;
        if(u_xlatb13){
            u_xlat7 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor1;
            u_xlat7 = u_xlat7 * _LineColor1.wwww;
            u_xlat16_12.x = (-_LineColor1.w) + 1.0;
            u_xlat16_8 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_11 = (bool(u_xlatb39)) ? u_xlat16_8 : u_xlat1;
            u_xlat16_7 = u_xlat7;
            u_xlati0 = int(0xFFFFFFFFu);
        } else {
            u_xlatb3.xy = lessThan(vec4(0.949999988, 0.949999988, 0.0, 0.0), u_xlat3.yzyy).xy;
            u_xlatb29.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat2.yzyz).xy;
            u_xlati3.xy = ivec2(uvec2((uint(u_xlatb29.x) * 0xffffffffu) | (uint(u_xlatb3.x) * 0xffffffffu), (uint(u_xlatb29.y) * 0xffffffffu) | (uint(u_xlatb3.y) * 0xffffffffu)));
            u_xlatb29.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat5.yzyz).xy;
            u_xlati3.xy = ivec2(uvec2((uint(u_xlatb29.x) * 0xffffffffu) | uint(u_xlati3.x), (uint(u_xlatb29.y) * 0xffffffffu) | uint(u_xlati3.y)));
            u_xlatb29.xy = lessThan(vec4(0.949999988, 0.949999988, 0.949999988, 0.949999988), u_xlat4.yzyz).xy;
            u_xlat2 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor2;
            u_xlat2 = u_xlat2 * _LineColor2.wwww;
            u_xlat16_12.x = (-_LineColor2.w) + 1.0;
            u_xlat16_4 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_4 = (bool(u_xlatb39)) ? u_xlat16_4 : u_xlat1;
            u_xlati3.xy = ivec2(uvec2((uint(u_xlatb29.x) * 0xffffffffu) | uint(u_xlati3.x), (uint(u_xlatb29.y) * 0xffffffffu) | uint(u_xlati3.y)));
            u_xlat5 = vec4(vec4(_LineIntensity, _LineIntensity, _LineIntensity, _LineIntensity)) * _LineColor3;
            u_xlat5 = u_xlat5 * _LineColor3.wwww;
            u_xlat16_12.x = (-_LineColor3.w) + 1.0;
            u_xlat16_8 = u_xlat1 * u_xlat16_12.xxxx;
            u_xlat16_8 = (bool(u_xlatb39)) ? u_xlat16_8 : u_xlat1;
            u_xlat16_1 = (u_xlati3.y != 0) ? u_xlat16_8 : u_xlat1;
            u_xlat16_5 = (u_xlati3.y != 0) ? u_xlat5 : vec4(0.0, 0.0, 0.0, 0.0);
            u_xlat16_11 = (u_xlati3.x != 0) ? u_xlat16_4 : u_xlat16_1;
            u_xlat16_7 = (u_xlati3.x != 0) ? u_xlat2 : u_xlat16_5;
            u_xlati0 = int(uint(uint(u_xlati3.y) | uint(u_xlati3.x)));
        }
        u_xlat1 = u_xlat16_7 * vec4(vec4(_FillAmount, _FillAmount, _FillAmount, _FillAmount));
        u_xlat16_6 = (bool(u_xlatb26)) ? u_xlat16_7 : u_xlat1;
    }
    if(u_xlati0 != 0) {
        u_xlat16_0 = u_xlat16_6 + u_xlat16_11;
        u_xlat1 = (-u_xlat16_0) + u_xlat16_6;
        u_xlat0 = vec4(vec4(_FillAmount, _FillAmount, _FillAmount, _FillAmount)) * u_xlat1 + u_xlat16_0;
        SV_Target0 = u_xlat0;
        return;
    } else {
        SV_Target0 = u_xlat16_11;
        return;
    }
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
Fallback "Diffuse"
}