// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "Malbers/Color4x4"
{
	Properties
	{
		[Header(Row 1)]_Color1("Color 1", Color) = (1,0.1544118,0.1544118,0.291)
		_Color2("Color 2", Color) = (1,0.1544118,0.8017241,0.253)
		_Color3("Color 3", Color) = (0.2535501,0.1544118,1,0.541)
		_Color4("Color 4", Color) = (0.1544118,0.5451319,1,0.253)
		[Header(Row 2)]_Color5("Color 5", Color) = (0.9533468,1,0.1544118,0.553)
		_Color6("Color 6", Color) = (0.2720588,0.1294625,0,0.097)
		_Color7("Color 7", Color) = (0.1544118,0.6151115,1,0.178)
		_Color8("Color 8", Color) = (0.4849697,0.5008695,0.5073529,0.078)
		[Header(Row 3)]_Color9("Color 9", Color) = (0.3164301,0,0.7058823,0.134)
		_Color10("Color 10", Color) = (0.362069,0.4411765,0,0.759)
		_Color11("Color 11", Color) = (0.6691177,0.6691177,0.6691177,0.647)
		_Color12("Color 12", Color) = (0.5073529,0.1574544,0,0.128)
		[Header(Row 4)]_Color13("Color 13", Color) = (1,0.5586207,0,0.272)
		_Color14("Color 14", Color) = (0,0.8025862,0.875,0.047)
		_Color15("Color 15", Color) = (1,0,0,0.391)
		_Color16("Color 16", Color) = (0.4080882,0.75,0.4811866,0.134)
		[HDR][Header(Emmision)]_Color15Emmision("Color 15 Emmision", Color) = (0,0,0,1)
		[HDR]_Color16Emmision("Color 16 Emmision", Color) = (0,0,0,1)
		[Header(Smoothness (Alphas))]_Smoothness("Smoothness", Range( 0 , 1)) = 1
		_Metallic("Metallic", Range( 0 , 1)) = 0
		[Header(Gradient)]_Gradient("Gradient", 2D) = "white" {}
		_GradientIntensity("Gradient Intensity", Range( 0 , 1)) = 0.75
		_GradientColor("Gradient Color", Color) = (0,0,0,0)
		_GradientScale("Gradient Scale", Float) = 1
		_GradientOffset("Gradient Offset", Float) = 0
		_GradientPower("Gradient Power", Float) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry+0" "IsEmissive" = "true"  }
		Cull Off
		CGPROGRAM
		#pragma target 3.0
		#pragma surface surf Standard keepalpha addshadow fullforwardshadows exclude_path:deferred 
		struct Input
		{
			float2 uv_texcoord;
		};

		uniform sampler2D _Gradient;
		uniform float4 _Gradient_ST;
		uniform float4 _GradientColor;
		uniform float _GradientIntensity;
		uniform float _GradientScale;
		uniform float _GradientOffset;
		uniform float _GradientPower;
		uniform float4 _Color1;
		uniform float4 _Color2;
		uniform float4 _Color3;
		uniform float4 _Color4;
		uniform float4 _Color5;
		uniform float4 _Color6;
		uniform float4 _Color7;
		uniform float4 _Color8;
		uniform float4 _Color9;
		uniform float4 _Color10;
		uniform float4 _Color11;
		uniform float4 _Color12;
		uniform float4 _Color13;
		uniform float4 _Color14;
		uniform float4 _Color15;
		uniform float4 _Color16;
		uniform float4 _Color15Emmision;
		uniform float4 _Color16Emmision;
		uniform float _Metallic;
		uniform float _Smoothness;

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			float2 uv_Gradient = i.uv_texcoord * _Gradient_ST.xy + _Gradient_ST.zw;
			float4 clampResult234 = clamp( ( ( tex2D( _Gradient, uv_Gradient ) + _GradientColor ) + ( 1.0 - _GradientIntensity ) ) , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
			float4 temp_cast_0 = (_GradientPower).xxxx;
			float temp_output_3_0_g474 = 1.0;
			float temp_output_7_0_g474 = 4.0;
			float temp_output_9_0_g474 = 4.0;
			float temp_output_8_0_g474 = 4.0;
			float temp_output_3_0_g470 = 2.0;
			float temp_output_7_0_g470 = 4.0;
			float temp_output_9_0_g470 = 4.0;
			float temp_output_8_0_g470 = 4.0;
			float temp_output_3_0_g475 = 3.0;
			float temp_output_7_0_g475 = 4.0;
			float temp_output_9_0_g475 = 4.0;
			float temp_output_8_0_g475 = 4.0;
			float temp_output_3_0_g453 = 4.0;
			float temp_output_7_0_g453 = 4.0;
			float temp_output_9_0_g453 = 4.0;
			float temp_output_8_0_g453 = 4.0;
			float temp_output_3_0_g469 = 1.0;
			float temp_output_7_0_g469 = 4.0;
			float temp_output_9_0_g469 = 3.0;
			float temp_output_8_0_g469 = 4.0;
			float temp_output_3_0_g461 = 2.0;
			float temp_output_7_0_g461 = 4.0;
			float temp_output_9_0_g461 = 3.0;
			float temp_output_8_0_g461 = 4.0;
			float temp_output_3_0_g473 = 3.0;
			float temp_output_7_0_g473 = 4.0;
			float temp_output_9_0_g473 = 3.0;
			float temp_output_8_0_g473 = 4.0;
			float temp_output_3_0_g454 = 4.0;
			float temp_output_7_0_g454 = 4.0;
			float temp_output_9_0_g454 = 3.0;
			float temp_output_8_0_g454 = 4.0;
			float temp_output_3_0_g460 = 1.0;
			float temp_output_7_0_g460 = 4.0;
			float temp_output_9_0_g460 = 2.0;
			float temp_output_8_0_g460 = 4.0;
			float temp_output_3_0_g468 = 2.0;
			float temp_output_7_0_g468 = 4.0;
			float temp_output_9_0_g468 = 2.0;
			float temp_output_8_0_g468 = 4.0;
			float temp_output_3_0_g476 = 3.0;
			float temp_output_7_0_g476 = 4.0;
			float temp_output_9_0_g476 = 2.0;
			float temp_output_8_0_g476 = 4.0;
			float temp_output_3_0_g471 = 4.0;
			float temp_output_7_0_g471 = 4.0;
			float temp_output_9_0_g471 = 2.0;
			float temp_output_8_0_g471 = 4.0;
			float temp_output_3_0_g459 = 1.0;
			float temp_output_7_0_g459 = 4.0;
			float temp_output_9_0_g459 = 1.0;
			float temp_output_8_0_g459 = 4.0;
			float temp_output_3_0_g449 = 2.0;
			float temp_output_7_0_g449 = 4.0;
			float temp_output_9_0_g449 = 1.0;
			float temp_output_8_0_g449 = 4.0;
			float temp_output_3_0_g472 = 3.0;
			float temp_output_7_0_g472 = 4.0;
			float temp_output_9_0_g472 = 1.0;
			float temp_output_8_0_g472 = 4.0;
			float temp_output_3_0_g467 = 4.0;
			float temp_output_7_0_g467 = 4.0;
			float temp_output_9_0_g467 = 1.0;
			float temp_output_8_0_g467 = 4.0;
			float4 temp_output_155_0 = ( ( ( _Color1 * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g474 - 1.0 ) / temp_output_7_0_g474 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g474 / temp_output_7_0_g474 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g474 - 1.0 ) / temp_output_8_0_g474 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g474 / temp_output_8_0_g474 ) ) * 1.0 ) ) ) ) + ( _Color2 * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g470 - 1.0 ) / temp_output_7_0_g470 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g470 / temp_output_7_0_g470 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g470 - 1.0 ) / temp_output_8_0_g470 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g470 / temp_output_8_0_g470 ) ) * 1.0 ) ) ) ) + ( _Color3 * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g475 - 1.0 ) / temp_output_7_0_g475 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g475 / temp_output_7_0_g475 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g475 - 1.0 ) / temp_output_8_0_g475 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g475 / temp_output_8_0_g475 ) ) * 1.0 ) ) ) ) + ( _Color4 * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g453 - 1.0 ) / temp_output_7_0_g453 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g453 / temp_output_7_0_g453 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g453 - 1.0 ) / temp_output_8_0_g453 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g453 / temp_output_8_0_g453 ) ) * 1.0 ) ) ) ) ) + ( ( _Color5 * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g469 - 1.0 ) / temp_output_7_0_g469 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g469 / temp_output_7_0_g469 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g469 - 1.0 ) / temp_output_8_0_g469 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g469 / temp_output_8_0_g469 ) ) * 1.0 ) ) ) ) + ( _Color6 * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g461 - 1.0 ) / temp_output_7_0_g461 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g461 / temp_output_7_0_g461 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g461 - 1.0 ) / temp_output_8_0_g461 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g461 / temp_output_8_0_g461 ) ) * 1.0 ) ) ) ) + ( _Color7 * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g473 - 1.0 ) / temp_output_7_0_g473 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g473 / temp_output_7_0_g473 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g473 - 1.0 ) / temp_output_8_0_g473 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g473 / temp_output_8_0_g473 ) ) * 1.0 ) ) ) ) + ( _Color8 * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g454 - 1.0 ) / temp_output_7_0_g454 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g454 / temp_output_7_0_g454 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g454 - 1.0 ) / temp_output_8_0_g454 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g454 / temp_output_8_0_g454 ) ) * 1.0 ) ) ) ) ) + ( ( _Color9 * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g460 - 1.0 ) / temp_output_7_0_g460 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g460 / temp_output_7_0_g460 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g460 - 1.0 ) / temp_output_8_0_g460 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g460 / temp_output_8_0_g460 ) ) * 1.0 ) ) ) ) + ( _Color10 * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g468 - 1.0 ) / temp_output_7_0_g468 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g468 / temp_output_7_0_g468 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g468 - 1.0 ) / temp_output_8_0_g468 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g468 / temp_output_8_0_g468 ) ) * 1.0 ) ) ) ) + ( _Color11 * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g476 - 1.0 ) / temp_output_7_0_g476 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g476 / temp_output_7_0_g476 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g476 - 1.0 ) / temp_output_8_0_g476 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g476 / temp_output_8_0_g476 ) ) * 1.0 ) ) ) ) + ( _Color12 * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g471 - 1.0 ) / temp_output_7_0_g471 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g471 / temp_output_7_0_g471 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g471 - 1.0 ) / temp_output_8_0_g471 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g471 / temp_output_8_0_g471 ) ) * 1.0 ) ) ) ) ) + ( ( _Color13 * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g459 - 1.0 ) / temp_output_7_0_g459 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g459 / temp_output_7_0_g459 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g459 - 1.0 ) / temp_output_8_0_g459 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g459 / temp_output_8_0_g459 ) ) * 1.0 ) ) ) ) + ( _Color14 * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g449 - 1.0 ) / temp_output_7_0_g449 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g449 / temp_output_7_0_g449 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g449 - 1.0 ) / temp_output_8_0_g449 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g449 / temp_output_8_0_g449 ) ) * 1.0 ) ) ) ) + ( _Color15 * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g472 - 1.0 ) / temp_output_7_0_g472 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g472 / temp_output_7_0_g472 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g472 - 1.0 ) / temp_output_8_0_g472 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g472 / temp_output_8_0_g472 ) ) * 1.0 ) ) ) ) + ( _Color16 * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g467 - 1.0 ) / temp_output_7_0_g467 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g467 / temp_output_7_0_g467 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g467 - 1.0 ) / temp_output_8_0_g467 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g467 / temp_output_8_0_g467 ) ) * 1.0 ) ) ) ) ) );
			float4 temp_output_236_0 = ( pow( (clampResult234*_GradientScale + _GradientOffset) , temp_cast_0 ) * temp_output_155_0 );
			o.Albedo = temp_output_236_0.rgb;
			float temp_output_3_0_g477 = 3.0;
			float temp_output_7_0_g477 = 4.0;
			float temp_output_9_0_g477 = 1.0;
			float temp_output_8_0_g477 = 4.0;
			float temp_output_3_0_g478 = 4.0;
			float temp_output_7_0_g478 = 4.0;
			float temp_output_9_0_g478 = 1.0;
			float temp_output_8_0_g478 = 4.0;
			o.Emission = ( ( _Color15Emmision * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g477 - 1.0 ) / temp_output_7_0_g477 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g477 / temp_output_7_0_g477 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g477 - 1.0 ) / temp_output_8_0_g477 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g477 / temp_output_8_0_g477 ) ) * 1.0 ) ) ) ) + ( _Color16Emmision * ( ( ( 1.0 - step( i.uv_texcoord.x , ( ( temp_output_3_0_g478 - 1.0 ) / temp_output_7_0_g478 ) ) ) * ( step( i.uv_texcoord.x , ( temp_output_3_0_g478 / temp_output_7_0_g478 ) ) * 1.0 ) ) * ( ( 1.0 - step( i.uv_texcoord.y , ( ( temp_output_9_0_g478 - 1.0 ) / temp_output_8_0_g478 ) ) ) * ( step( i.uv_texcoord.y , ( temp_output_9_0_g478 / temp_output_8_0_g478 ) ) * 1.0 ) ) ) ) ).rgb;
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
608;182;1189;592;-1268.28;550.2061;3.1;True;True
Node;AmplifyShaderEditor.ColorNode;229;966.8561,-113.2386;Float;False;Property;_GradientColor;Gradient Color;22;0;Create;True;0;0;False;0;0,0,0,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;230;931.2261,-351.7579;Float;True;Property;_Gradient;Gradient;20;0;Create;True;0;0;False;1;Header(Gradient);0f424a347039ef447a763d3d4b4782b0;0f424a347039ef447a763d3d4b4782b0;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;6;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;228;1005.463,185.5694;Float;False;Property;_GradientIntensity;Gradient Intensity;21;0;Create;True;0;0;False;0;0.75;0.75;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;157;-182.3802,1181.25;Float;False;Property;_Color7;Color 7;6;0;Create;True;0;0;False;0;0.1544118,0.6151115,1,0.178;0.6343814,0.75,0.3088235,0.559;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;182;-220.2247,2417.44;Float;False;Property;_Color12;Color 12;11;0;Create;True;0;0;False;0;0.5073529,0.1574544,0,0.128;0.6911765,0.3944388,0.3709991,0.734;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;181;-218.8154,2174.284;Float;False;Property;_Color11;Color 11;10;0;Create;True;0;0;False;0;0.6691177,0.6691177,0.6691177,0.647;0.3888796,0.4705882,0.100346,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;214;-242.6307,2942.365;Float;False;Property;_Color14;Color 14;13;0;Create;True;0;0;False;0;0,0.8025862,0.875,0.047;0.09411766,0.1294118,0.1372549,0.047;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;159;-187.9672,688.0273;Float;False;Property;_Color5;Color 5;4;0;Create;True;0;0;False;1;Header(Row 2);0.9533468,1,0.1544118,0.553;0.6323529,0.5688611,0.2138841,0.259;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;152;-194.2135,166.9271;Float;False;Property;_Color3;Color 3;2;0;Create;True;0;0;False;0;0.2535501,0.1544118,1,0.541;0.6323529,0.5688611,0.2138841,0.259;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;213;-234.6901,2683.007;Float;False;Property;_Color13;Color 13;12;0;Create;True;0;0;False;1;Header(Row 4);1,0.5586207,0,0.272;0.8745099,0.6980392,0.4745098,0.272;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;23;-199.8005,-326.2955;Float;False;Property;_Color1;Color 1;0;0;Create;True;0;0;False;1;Header(Row 1);1,0.1544118,0.1544118,0.291;0.1231535,0.3088235,0.04995674,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;150;-207.7412,-66.93771;Float;False;Property;_Color2;Color 2;1;0;Create;True;0;0;False;0;1,0.1544118,0.8017241,0.253;0.1624164,0.416,0.06244594,0.091;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;158;-183.7895,1424.406;Float;False;Property;_Color8;Color 8;7;0;Create;True;0;0;False;0;0.4849697,0.5008695,0.5073529,0.078;0.4868408,0.6691177,0.280439,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;154;-195.6228,411.2479;Float;False;Property;_Color4;Color 4;3;0;Create;True;0;0;False;0;0.1544118,0.5451319,1,0.253;0.09991348,0.1029412,0.10244,0.253;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;180;-232.3431,1940.419;Float;False;Property;_Color10;Color 10;9;0;Create;True;0;0;False;0;0.362069,0.4411765,0,0.759;0.1231535,0.3088235,0.04995674,0;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;217;-264.3738,3419.386;Float;False;Property;_Color16;Color 16;15;0;Create;True;0;0;False;0;0.4080882,0.75,0.4811866,0.134;0.1215686,0.2784314,0.05882353,0.134;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.OneMinusNode;232;1295.804,136.3911;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;183;-224.4024,1681.061;Float;False;Property;_Color9;Color 9;8;0;Create;True;0;0;False;1;Header(Row 3);0.3164301,0,0.7058823,0.134;0.08028764,0.1789584,0.1985294,0.391;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;218;-229.103,3176.23;Float;False;Property;_Color15;Color 15;14;0;Create;True;0;0;False;0;1,0,0,0.391;0.07450981,0.172549,0.1921569,0.391;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;231;1300.521,-108.6907;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;156;-195.9079,947.3851;Float;False;Property;_Color6;Color 6;5;0;Create;True;0;0;False;0;0.2720588,0.1294625,0,0.097;0.1624164,0.416,0.06244594,0.091;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.FunctionNode;160;119.8096,952.2258;Float;True;ColorShartSlot;-1;;461;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;2;False;9;FLOAT;3;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;216;81.02762,2687.848;Float;True;ColorShartSlot;-1;;459;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;1;False;9;FLOAT;1;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;188;91.31517,1685.902;Float;True;ColorShartSlot;-1;;460;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;1;False;9;FLOAT;2;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;233;1481.021,-139.1108;Float;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;222;87.12894,3424.227;Float;True;ColorShartSlot;-1;;467;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;4;False;9;FLOAT;1;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;162;133.8517,1429.247;Float;True;ColorShartSlot;-1;;454;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;4;False;9;FLOAT;3;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;223;73.08682,2945.046;Float;True;ColorShartSlot;-1;;449;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;2;False;9;FLOAT;1;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;185;97.41646,2422.281;Float;True;ColorShartSlot;-1;;471;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;4;False;9;FLOAT;2;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;153;122.0185,414.924;Float;True;ColorShartSlot;-1;;453;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;4;False;9;FLOAT;4;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;149;107.9764,-62.09709;Float;True;ColorShartSlot;-1;;470;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;2;False;9;FLOAT;4;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;163;127.7504,692.868;Float;True;ColorShartSlot;-1;;469;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;1;False;9;FLOAT;3;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;186;96.90227,2179.125;Float;True;ColorShartSlot;-1;;476;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;3;False;9;FLOAT;2;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;151;121.5042,171.7677;Float;True;ColorShartSlot;-1;;475;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;3;False;9;FLOAT;4;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;187;83.37437,1945.26;Float;True;ColorShartSlot;-1;;468;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;2;False;9;FLOAT;2;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;161;133.3375,1186.091;Float;True;ColorShartSlot;-1;;473;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;3;False;9;FLOAT;3;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;224;86.61465,3181.071;Float;True;ColorShartSlot;-1;;472;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;3;False;9;FLOAT;1;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;145;115.9171,-321.4549;Float;True;ColorShartSlot;-1;;474;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;1;False;9;FLOAT;4;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;184;1537.758,1310.802;Float;True;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;146;1539.255,777.6315;Float;True;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;225;1534.365,1575.009;Float;True;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;238;1784.681,146.3308;Float;False;Property;_GradientScale;Gradient Scale;23;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;239;1791.499,239.074;Float;False;Property;_GradientOffset;Gradient Offset;24;0;Create;True;0;0;False;0;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;234;1765.769,-101.2706;Float;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;164;1539.944,1043.66;Float;True;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ScaleAndOffsetNode;237;2134.751,-6.152725;Float;True;3;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;245;1807.933,349.2413;Float;False;Property;_GradientPower;Gradient Power;25;0;Create;True;0;0;False;0;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;240;2745.767,1001.892;Float;False;Property;_Color16Emmision;Color 16 Emmision;17;1;[HDR];Create;True;0;0;False;0;0,0,0,1;0,0,0,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;155;1914.739,1110.013;Float;True;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;241;2755,750.5939;Float;False;Property;_Color15Emmision;Color 15 Emmision;16;1;[HDR];Create;True;0;0;False;1;Header(Emmision);0,0,0,1;0,0,0,1;False;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.PowerNode;246;2330.054,313.4161;Float;True;2;0;COLOR;0,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;166;2465.406,1571.782;Float;False;Property;_Smoothness;Smoothness;18;0;Create;True;0;0;False;1;Header(Smoothness (Alphas));1;1;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;242;3073.961,755.4349;Float;True;ColorShartSlot;-1;;477;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;3;False;9;FLOAT;1;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.FunctionNode;243;3074.475,998.5919;Float;True;ColorShartSlot;-1;;478;231fe18505db4a84b9c478d379c9247d;0;5;38;COLOR;0.7843138,0.3137255,0,0;False;3;FLOAT;4;False;9;FLOAT;1;False;7;FLOAT;4;False;8;FLOAT;4;False;1;COLOR;0
Node;AmplifyShaderEditor.ComponentMaskNode;227;2503.989,1371.3;Float;True;False;False;False;True;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;212;3115.522,1442.756;Float;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.VertexColorNode;247;2435.541,-52.01904;Float;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;244;3477.393,838.282;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;253;2944.54,171.518;Float;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;250;3217.498,244.4228;Float;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.OneMinusNode;254;2699.768,187.571;Float;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;165;3079.922,1286.956;Float;False;Property;_Metallic;Metallic;19;0;Create;True;0;0;False;0;0;0.25;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;236;2689.934,325.3839;Float;True;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;249;2399.374,204.8652;Float;False;Property;_VCIntensity;VC Intensity;26;0;Create;True;0;0;False;0;1;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;0;3680.683,780.2685;Float;False;True;2;Float;ASEMaterialInspector;0;0;Standard;Malbers/Color4x4;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;Off;0;False;-1;0;False;-1;False;0;False;-1;0;False;-1;False;0;Opaque;0.1;True;True;0;False;Opaque;;Geometry;ForwardOnly;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;True;0;False;-1;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;0;;-1;-1;-1;-1;0;False;0;0;False;-1;-1;0;False;-1;0;0;0;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;232;0;228;0
WireConnection;231;0;230;0
WireConnection;231;1;229;0
WireConnection;160;38;156;0
WireConnection;216;38;213;0
WireConnection;188;38;183;0
WireConnection;233;0;231;0
WireConnection;233;1;232;0
WireConnection;222;38;217;0
WireConnection;162;38;158;0
WireConnection;223;38;214;0
WireConnection;185;38;182;0
WireConnection;153;38;154;0
WireConnection;149;38;150;0
WireConnection;163;38;159;0
WireConnection;186;38;181;0
WireConnection;151;38;152;0
WireConnection;187;38;180;0
WireConnection;161;38;157;0
WireConnection;224;38;218;0
WireConnection;145;38;23;0
WireConnection;184;0;188;0
WireConnection;184;1;187;0
WireConnection;184;2;186;0
WireConnection;184;3;185;0
WireConnection;146;0;145;0
WireConnection;146;1;149;0
WireConnection;146;2;151;0
WireConnection;146;3;153;0
WireConnection;225;0;216;0
WireConnection;225;1;223;0
WireConnection;225;2;224;0
WireConnection;225;3;222;0
WireConnection;234;0;233;0
WireConnection;164;0;163;0
WireConnection;164;1;160;0
WireConnection;164;2;161;0
WireConnection;164;3;162;0
WireConnection;237;0;234;0
WireConnection;237;1;238;0
WireConnection;237;2;239;0
WireConnection;155;0;146;0
WireConnection;155;1;164;0
WireConnection;155;2;184;0
WireConnection;155;3;225;0
WireConnection;246;0;237;0
WireConnection;246;1;245;0
WireConnection;242;38;241;0
WireConnection;243;38;240;0
WireConnection;227;0;155;0
WireConnection;212;0;227;0
WireConnection;212;1;166;0
WireConnection;244;0;242;0
WireConnection;244;1;243;0
WireConnection;253;0;247;0
WireConnection;253;1;254;0
WireConnection;250;0;253;0
WireConnection;250;1;236;0
WireConnection;254;0;249;0
WireConnection;236;0;246;0
WireConnection;236;1;155;0
WireConnection;0;0;236;0
WireConnection;0;2;244;0
WireConnection;0;3;165;0
WireConnection;0;4;212;0
ASEEND*/
//CHKSM=972514903B67B320C5885EB3BC6FB7884F9901B4