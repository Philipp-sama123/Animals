// Upgrade NOTE: upgraded instancing buffer 'MalbersColor4x2Emission' to new syntax.

// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Malbers/Color4x2 Emission"
{
	Properties
	{
		_Color1("Color 1", Color) = (1,0.1544118,0.1544118,0.397)
		_Emmision1("Emmision1", Color) = (0,0,0,0.397)
		_Color2("Color 2", Color) = (1,0.1544118,0.8017241,0.334)
		_Emmision2("Emmision2", Color) = (0,0,0,0.334)
		_Color3("Color 3", Color) = (0.2535501,0.1544118,1,0.228)
		_Emmision3("Emmision3", Color) = (0,0,0,0.228)
		_Color4("Color 4", Color) = (0.1544118,0.5451319,1,0.472)
		_Emmision4("Emmision4", Color) = (0,0,0,0.472)
		_Color5("Color 5", Color) = (0.9533468,1,0.1544118,0.353)
		_Emmision5("Emmision5", Color) = (0,0,0,0.353)
		_Color6("Color 6", Color) = (0.8483773,1,0.1544118,0.341)
		_Emmision6("Emmision6", Color) = (0,0,0,0.341)
		_Color7("Color 7", Color) = (0.1544118,0.6151115,1,0.316)
		_Emmision7("Emmision7", Color) = (0,0,0,0.316)
		_Color8("Color 8", Color) = (0.4849697,0.5008695,0.5073529,0.484)
		_Emmision8("Emmision8", Color) = (0,0,0,0.484)
		_EmmisionPower("Emmision Power", Float) = 1
		_Smoothness("Smoothness", Range( 0 , 1)) = 1
		_Metallic("Metallic", Range( 0 , 1)) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Off
		CGPROGRAM
		#pragma target 3.0
		#pragma multi_compile_instancing
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform float _EmmisionPower;
		uniform float _Metallic;
		uniform float _Smoothness;

		UNITY_INSTANCING_BUFFER_START(MalbersColor4x2Emission)
			UNITY_DEFINE_INSTANCED_PROP(float4, _Color1)
#define _Color1_arr MalbersColor4x2Emission
			UNITY_DEFINE_INSTANCED_PROP(float4, _Color2)
#define _Color2_arr MalbersColor4x2Emission
			UNITY_DEFINE_INSTANCED_PROP(float4, _Color3)
#define _Color3_arr MalbersColor4x2Emission
			UNITY_DEFINE_INSTANCED_PROP(float4, _Color4)
#define _Color4_arr MalbersColor4x2Emission
			UNITY_DEFINE_INSTANCED_PROP(float4, _Color5)
#define _Color5_arr MalbersColor4x2Emission
			UNITY_DEFINE_INSTANCED_PROP(float4, _Color6)
#define _Color6_arr MalbersColor4x2Emission
			UNITY_DEFINE_INSTANCED_PROP(float4, _Color7)
#define _Color7_arr MalbersColor4x2Emission
			UNITY_DEFINE_INSTANCED_PROP(float4, _Color8)
#define _Color8_arr MalbersColor4x2Emission
			UNITY_DEFINE_INSTANCED_PROP(float4, _Emmision1)
#define _Emmision1_arr MalbersColor4x2Emission
			UNITY_DEFINE_INSTANCED_PROP(float4, _Emmision2)
#define _Emmision2_arr MalbersColor4x2Emission
			UNITY_DEFINE_INSTANCED_PROP(float4, _Emmision3)
#define _Emmision3_arr MalbersColor4x2Emission
			UNITY_DEFINE_INSTANCED_PROP(float4, _Emmision4)
#define _Emmision4_arr MalbersColor4x2Emission
			UNITY_DEFINE_INSTANCED_PROP(float4, _Emmision5)
#define _Emmision5_arr MalbersColor4x2Emission
			UNITY_DEFINE_INSTANCED_PROP(float4, _Emmision6)
#define _Emmision6_arr MalbersColor4x2Emission
			UNITY_DEFINE_INSTANCED_PROP(float4, _Emmision7)
#define _Emmision7_arr MalbersColor4x2Emission
			UNITY_DEFINE_INSTANCED_PROP(float4, _Emmision8)
#define _Emmision8_arr MalbersColor4x2Emission
		UNITY_INSTANCING_BUFFER_END(MalbersColor4x2Emission)

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float4 _Color1_Instance = UNITY_ACCESS_INSTANCED_PROP(_Color1_arr, _Color1);
			float temp_output_3_0_g147 = 1.0;
			float temp_output_7_0_g147 = 4.0;
			float temp_output_9_0_g147 = 2.0;
			float temp_output_8_0_g147 = 2.0;
			float4 _Color2_Instance = UNITY_ACCESS_INSTANCED_PROP(_Color2_arr, _Color2);
			float temp_output_3_0_g141 = 2.0;
			float temp_output_7_0_g141 = 4.0;
			float temp_output_9_0_g141 = 2.0;
			float temp_output_8_0_g141 = 2.0;
			float4 _Color3_Instance = UNITY_ACCESS_INSTANCED_PROP(_Color3_arr, _Color3);
			float temp_output_3_0_g150 = 3.0;
			float temp_output_7_0_g150 = 4.0;
			float temp_output_9_0_g150 = 2.0;
			float temp_output_8_0_g150 = 2.0;
			float4 _Color4_Instance = UNITY_ACCESS_INSTANCED_PROP(_Color4_arr, _Color4);
			float temp_output_3_0_g142 = 4.0;
			float temp_output_7_0_g142 = 4.0;
			float temp_output_9_0_g142 = 2.0;
			float temp_output_8_0_g142 = 2.0;
			float4 _Color5_Instance = UNITY_ACCESS_INSTANCED_PROP(_Color5_arr, _Color5);
			float temp_output_3_0_g151 = 1.0;
			float temp_output_7_0_g151 = 4.0;
			float temp_output_9_0_g151 = 1.0;
			float temp_output_8_0_g151 = 2.0;
			float4 _Color6_Instance = UNITY_ACCESS_INSTANCED_PROP(_Color6_arr, _Color6);
			float temp_output_3_0_g149 = 2.0;
			float temp_output_7_0_g149 = 4.0;
			float temp_output_9_0_g149 = 1.0;
			float temp_output_8_0_g149 = 2.0;
			float4 _Color7_Instance = UNITY_ACCESS_INSTANCED_PROP(_Color7_arr, _Color7);
			float temp_output_3_0_g146 = 3.0;
			float temp_output_7_0_g146 = 4.0;
			float temp_output_9_0_g146 = 1.0;
			float temp_output_8_0_g146 = 2.0;
			float4 _Color8_Instance = UNITY_ACCESS_INSTANCED_PROP(_Color8_arr, _Color8);
			float temp_output_3_0_g148 = 4.0;
			float temp_output_7_0_g148 = 4.0;
			float temp_output_9_0_g148 = 1.0;
			float temp_output_8_0_g148 = 2.0;
			float4 temp_output_155_0 = ( ( ( _Color1_Instance * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g147 - 1.0 ) / temp_output_7_0_g147 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g147 / temp_output_7_0_g147 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g147 - 1.0 ) / temp_output_8_0_g147 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g147 / temp_output_8_0_g147 ) ) * 1.0 ) ) ) ) + ( _Color2_Instance * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g141 - 1.0 ) / temp_output_7_0_g141 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g141 / temp_output_7_0_g141 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g141 - 1.0 ) / temp_output_8_0_g141 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g141 / temp_output_8_0_g141 ) ) * 1.0 ) ) ) ) + ( _Color3_Instance * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g150 - 1.0 ) / temp_output_7_0_g150 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g150 / temp_output_7_0_g150 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g150 - 1.0 ) / temp_output_8_0_g150 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g150 / temp_output_8_0_g150 ) ) * 1.0 ) ) ) ) + ( _Color4_Instance * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g142 - 1.0 ) / temp_output_7_0_g142 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g142 / temp_output_7_0_g142 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g142 - 1.0 ) / temp_output_8_0_g142 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g142 / temp_output_8_0_g142 ) ) * 1.0 ) ) ) ) ) + ( ( _Color5_Instance * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g151 - 1.0 ) / temp_output_7_0_g151 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g151 / temp_output_7_0_g151 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g151 - 1.0 ) / temp_output_8_0_g151 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g151 / temp_output_8_0_g151 ) ) * 1.0 ) ) ) ) + ( _Color6_Instance * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g149 - 1.0 ) / temp_output_7_0_g149 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g149 / temp_output_7_0_g149 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g149 - 1.0 ) / temp_output_8_0_g149 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g149 / temp_output_8_0_g149 ) ) * 1.0 ) ) ) ) + ( _Color7_Instance * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g146 - 1.0 ) / temp_output_7_0_g146 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g146 / temp_output_7_0_g146 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g146 - 1.0 ) / temp_output_8_0_g146 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g146 / temp_output_8_0_g146 ) ) * 1.0 ) ) ) ) + ( _Color8_Instance * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g148 - 1.0 ) / temp_output_7_0_g148 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g148 / temp_output_7_0_g148 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g148 - 1.0 ) / temp_output_8_0_g148 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g148 / temp_output_8_0_g148 ) ) * 1.0 ) ) ) ) ) );
			o.Albedo = temp_output_155_0.rgb;
			float4 _Emmision1_Instance = UNITY_ACCESS_INSTANCED_PROP(_Emmision1_arr, _Emmision1);
			float temp_output_3_0_g162 = 1.0;
			float temp_output_7_0_g162 = 4.0;
			float temp_output_9_0_g162 = 2.0;
			float temp_output_8_0_g162 = 2.0;
			float4 _Emmision2_Instance = UNITY_ACCESS_INSTANCED_PROP(_Emmision2_arr, _Emmision2);
			float temp_output_3_0_g156 = 2.0;
			float temp_output_7_0_g156 = 4.0;
			float temp_output_9_0_g156 = 2.0;
			float temp_output_8_0_g156 = 2.0;
			float4 _Emmision3_Instance = UNITY_ACCESS_INSTANCED_PROP(_Emmision3_arr, _Emmision3);
			float temp_output_3_0_g158 = 3.0;
			float temp_output_7_0_g158 = 4.0;
			float temp_output_9_0_g158 = 2.0;
			float temp_output_8_0_g158 = 2.0;
			float4 _Emmision4_Instance = UNITY_ACCESS_INSTANCED_PROP(_Emmision4_arr, _Emmision4);
			float temp_output_3_0_g155 = 4.0;
			float temp_output_7_0_g155 = 4.0;
			float temp_output_9_0_g155 = 2.0;
			float temp_output_8_0_g155 = 2.0;
			float4 _Emmision5_Instance = UNITY_ACCESS_INSTANCED_PROP(_Emmision5_arr, _Emmision5);
			float temp_output_3_0_g157 = 1.0;
			float temp_output_7_0_g157 = 4.0;
			float temp_output_9_0_g157 = 1.0;
			float temp_output_8_0_g157 = 2.0;
			float4 _Emmision6_Instance = UNITY_ACCESS_INSTANCED_PROP(_Emmision6_arr, _Emmision6);
			float temp_output_3_0_g161 = 2.0;
			float temp_output_7_0_g161 = 4.0;
			float temp_output_9_0_g161 = 1.0;
			float temp_output_8_0_g161 = 2.0;
			float4 _Emmision7_Instance = UNITY_ACCESS_INSTANCED_PROP(_Emmision7_arr, _Emmision7);
			float temp_output_3_0_g160 = 3.0;
			float temp_output_7_0_g160 = 4.0;
			float temp_output_9_0_g160 = 1.0;
			float temp_output_8_0_g160 = 2.0;
			float4 _Emmision8_Instance = UNITY_ACCESS_INSTANCED_PROP(_Emmision8_arr, _Emmision8);
			float temp_output_3_0_g159 = 4.0;
			float temp_output_7_0_g159 = 4.0;
			float temp_output_9_0_g159 = 1.0;
			float temp_output_8_0_g159 = 2.0;
			o.Emission = ( ( ( ( _Emmision1_Instance * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g162 - 1.0 ) / temp_output_7_0_g162 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g162 / temp_output_7_0_g162 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g162 - 1.0 ) / temp_output_8_0_g162 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g162 / temp_output_8_0_g162 ) ) * 1.0 ) ) ) ) + ( _Emmision2_Instance * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g156 - 1.0 ) / temp_output_7_0_g156 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g156 / temp_output_7_0_g156 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g156 - 1.0 ) / temp_output_8_0_g156 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g156 / temp_output_8_0_g156 ) ) * 1.0 ) ) ) ) + ( _Emmision3_Instance * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g158 - 1.0 ) / temp_output_7_0_g158 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g158 / temp_output_7_0_g158 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g158 - 1.0 ) / temp_output_8_0_g158 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g158 / temp_output_8_0_g158 ) ) * 1.0 ) ) ) ) + ( _Emmision4_Instance * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g155 - 1.0 ) / temp_output_7_0_g155 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g155 / temp_output_7_0_g155 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g155 - 1.0 ) / temp_output_8_0_g155 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g155 / temp_output_8_0_g155 ) ) * 1.0 ) ) ) ) ) + ( ( _Emmision5_Instance * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g157 - 1.0 ) / temp_output_7_0_g157 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g157 / temp_output_7_0_g157 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g157 - 1.0 ) / temp_output_8_0_g157 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g157 / temp_output_8_0_g157 ) ) * 1.0 ) ) ) ) + ( _Emmision6_Instance * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g161 - 1.0 ) / temp_output_7_0_g161 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g161 / temp_output_7_0_g161 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g161 - 1.0 ) / temp_output_8_0_g161 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g161 / temp_output_8_0_g161 ) ) * 1.0 ) ) ) ) + ( _Emmision7_Instance * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g160 - 1.0 ) / temp_output_7_0_g160 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g160 / temp_output_7_0_g160 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g160 - 1.0 ) / temp_output_8_0_g160 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g160 / temp_output_8_0_g160 ) ) * 1.0 ) ) ) ) + ( _Emmision8_Instance * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g159 - 1.0 ) / temp_output_7_0_g159 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g159 / temp_output_7_0_g159 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g159 - 1.0 ) / temp_output_8_0_g159 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g159 / temp_output_8_0_g159 ) ) * 1.0 ) ) ) ) ) ) * _EmmisionPower ).rgb;
			o.Metallic = _Metallic;
			o.Smoothness = ( (temp_output_155_0).a * _Smoothness );
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
}
/*ASEBEGIN
Version=16200
7;105;1466;871;-1251.255;396.4213;2.445154;True;True
Node;AmplifyShaderEditor.ColorNode;158;-183.7895,1424.406;Float;False;InstancedProperty;_Color8;Color 8;14;0;Create;True;0;0;False;0;0.4849697,0.5008695,0.5073529,0.484;0.4849697,0.5008695,0.5073529,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;156;-195.9079,947.3851;Float;False;InstancedProperty;_Color6;Color 6;10;0;Create;True;0;0;False;0;0.8483773,1,0.1544118,0.341;0.8483773,1,0.1544118,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;159;-187.9672,688.0273;Float;False;InstancedProperty;_Color5;Color 5;8;0;Create;True;0;0;False;0;0.9533468,1,0.1544118,0.353;0.9533468,1,0.1544118,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;154;-195.6228,411.2479;Float;False;InstancedProperty;_Color4;Color 4;6;0;Create;True;0;0;False;0;0.1544118,0.5451319,1,0.472;0.1544118,0.5451319,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;157;-182.3802,1181.25;Float;False;InstancedProperty;_Color7;Color 7;12;0;Create;True;0;0;False;0;0.1544118,0.6151115,1,0.316;0.1544118,0.6151115,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;23;-199.8005,-326.2955;Float;False;InstancedProperty;_Color1;Color 1;0;0;Create;True;0;0;False;0;1,0.1544118,0.1544118,0.397;1,0.1544118,0.1544118,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;150;-207.7412,-66.93771;Float;False;InstancedProperty;_Color2;Color 2;2;0;Create;True;0;0;False;0;1,0.1544118,0.8017241,0.334;1,0.1544118,0.8017241,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;152;-194.2135,166.9271;Float;False;InstancedProperty;_Color3;Color 3;4;0;Create;True;0;0;False;0;0.2535501,0.1544118,1,0.228;0.2535501,0.1544118,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;163;127.7504,688.1025;Float;True;ColorShartSlot;-1;;151;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;1;False;9;FLOAT;1;False;7;FLOAT;4;False;8;FLOAT;2;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;182;887.264,2267.629;Float;False;InstancedProperty;_Emmision5;Emmision5;9;0;Create;True;0;0;False;0;0,0,0,0.353;0.9533468,1,0.1544118,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;151;121.5042,167.0022;Float;True;ColorShartSlot;-1;;150;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;3;False;9;FLOAT;2;False;7;FLOAT;4;False;8;FLOAT;2;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;160;119.8096,947.4603;Float;True;ColorShartSlot;-1;;149;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;2;False;9;FLOAT;1;False;7;FLOAT;4;False;8;FLOAT;2;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;162;133.8517,1424.481;Float;True;ColorShartSlot;-1;;148;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;4;False;9;FLOAT;1;False;7;FLOAT;4;False;8;FLOAT;2;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;145;115.9171,-326.2204;Float;True;ColorShartSlot;-1;;147;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;1;False;9;FLOAT;2;False;7;FLOAT;4;False;8;FLOAT;2;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;161;133.3375,1181.325;Float;True;ColorShartSlot;-1;;146;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;3;False;9;FLOAT;1;False;7;FLOAT;4;False;8;FLOAT;2;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;181;879.3232,2526.987;Float;False;InstancedProperty;_Emmision6;Emmision6;11;0;Create;True;0;0;False;0;0,0,0,0.341;0.8483773,1,0.1544118,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;149;107.9764,-66.86263;Float;True;ColorShartSlot;-1;;141;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;2;False;9;FLOAT;2;False;7;FLOAT;4;False;8;FLOAT;2;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;183;879.6084,1990.85;Float;False;InstancedProperty;_Emmision4;Emmision4;7;0;Create;True;0;0;False;0;0,0,0,0.472;0.1544118,0.5451319,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;187;881.0177,1746.529;Float;False;InstancedProperty;_Emmision3;Emmision3;5;0;Create;True;0;0;False;0;0,0,0,0.228;0.2535501,0.1544118,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;186;867.49,1512.665;Float;False;InstancedProperty;_Emmision2;Emmision2;3;0;Create;True;0;0;False;0;0,0,0,0.334;1,0.1544118,0.8017241,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;184;892.8509,2760.852;Float;False;InstancedProperty;_Emmision7;Emmision7;13;0;Create;True;0;0;False;0;0,0,0,0.316;0.1544118,0.6151115,1,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;185;875.4307,1253.307;Float;False;InstancedProperty;_Emmision1;Emmision1;1;0;Create;True;0;0;False;0;0,0,0,0.397;1,0.1544118,0.1544118,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;180;891.4416,3004.008;Float;False;InstancedProperty;_Emmision8;Emmision8;15;0;Create;True;0;0;False;0;0,0,0,0.484;0.4849697,0.5008695,0.5073529,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;153;122.0185,410.1585;Float;True;ColorShartSlot;-1;;142;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;4;False;9;FLOAT;2;False;7;FLOAT;4;False;8;FLOAT;2;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;192;1191.148,1253.382;Float;True;ColorShartSlot;-1;;162;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;1;False;9;FLOAT;2;False;7;FLOAT;4;False;8;FLOAT;2;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;189;1195.041,2527.062;Float;True;ColorShartSlot;-1;;161;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;2;False;9;FLOAT;1;False;7;FLOAT;4;False;8;FLOAT;2;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;164;1130.732,57.40811;Float;True;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;190;1208.569,2760.927;Float;True;ColorShartSlot;-1;;160;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;3;False;9;FLOAT;1;False;7;FLOAT;4;False;8;FLOAT;2;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;146;1124.026,-170.6852;Float;True;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;188;1196.735,1746.604;Float;True;ColorShartSlot;-1;;158;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;3;False;9;FLOAT;2;False;7;FLOAT;4;False;8;FLOAT;2;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;193;1202.982,2267.705;Float;True;ColorShartSlot;-1;;157;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;1;False;9;FLOAT;1;False;7;FLOAT;4;False;8;FLOAT;2;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;195;1183.208,1512.74;Float;True;ColorShartSlot;-1;;156;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;2;False;9;FLOAT;2;False;7;FLOAT;4;False;8;FLOAT;2;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;194;1197.25,1989.761;Float;True;ColorShartSlot;-1;;155;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;4;False;9;FLOAT;2;False;7;FLOAT;4;False;8;FLOAT;2;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;191;1209.083,3004.083;Float;True;ColorShartSlot;-1;;159;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;4;False;9;FLOAT;1;False;7;FLOAT;4;False;8;FLOAT;2;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;196;2199.257,1408.917;Float;True;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;197;2205.963,1637.01;Float;True;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;155;1378.894,-29.6249;Float;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ComponentMaskNode;179;1447.85,243.531;Float;False;False;False;False;True;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;199;2464.377,1845.544;Float;False;Property;_EmmisionPower;Emmision Power;16;0;Create;True;0;0;False;0;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;166;1287.072,404.6109;Float;False;Property;_Smoothness;Smoothness;17;0;Create;True;0;0;False;0;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;198;2454.125,1549.977;Float;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;201;2767.389,1643.219;Float;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;165;1691.967,238.6589;Float;False;Property;_Metallic;Metallic;18;0;Create;True;0;0;False;0;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;178;1695.109,386.3072;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;3276.286,242.0314;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;Malbers/Color4x2 Emission;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.5;True;True;0;False;Opaque;;Geometry;All;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;163;38;159;0
WireConnection;151;38;152;0
WireConnection;160;38;156;0
WireConnection;162;38;158;0
WireConnection;145;38;23;0
WireConnection;161;38;157;0
WireConnection;149;38;150;0
WireConnection;153;38;154;0
WireConnection;192;38;185;0
WireConnection;189;38;181;0
WireConnection;164;0;163;0
WireConnection;164;1;160;0
WireConnection;164;2;161;0
WireConnection;164;3;162;0
WireConnection;190;38;184;0
WireConnection;146;0;145;0
WireConnection;146;1;149;0
WireConnection;146;2;151;0
WireConnection;146;3;153;0
WireConnection;188;38;187;0
WireConnection;193;38;182;0
WireConnection;195;38;186;0
WireConnection;194;38;183;0
WireConnection;191;38;180;0
WireConnection;196;0;192;0
WireConnection;196;1;195;0
WireConnection;196;2;188;0
WireConnection;196;3;194;0
WireConnection;197;0;193;0
WireConnection;197;1;189;0
WireConnection;197;2;190;0
WireConnection;197;3;191;0
WireConnection;155;0;146;0
WireConnection;155;1;164;0
WireConnection;179;0;155;0
WireConnection;198;0;196;0
WireConnection;198;1;197;0
WireConnection;201;0;198;0
WireConnection;201;1;199;0
WireConnection;178;0;179;0
WireConnection;178;1;166;0
WireConnection;0;0;155;0
WireConnection;0;2;201;0
WireConnection;0;3;165;0
WireConnection;0;4;178;0
ASEEND*/
//CHKSM=C085A732DE30E0304768FD0899C8C157312EEAEC