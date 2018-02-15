﻿// Upgrade NOTE: replaced '_World2Object' with 'unity_WorldToObject'

Shader "Unity Shaders Book/Chapter 6/DiffusePixel-Level" {
	Properties {
		// default value is white color
		_Diffuse ("Diffuse", Color) = (1, 1, 1, 1)
	}

	SubShader {
		pass{
			Tags { "LightMode"="ForwardBase" }

			CGPROGRAM
				
			#pragma vertex vert
			#pragma fragment frag

			#include "Lighting.cginc"

			// color range between 0~1
			fixed4 _Diffuse;

			struct a2v {
				float4 vertex : POSITION;
				float3 normal : NORMAL;
			};

			struct v2f {
				float4 pos : SV_POSITION;
				//fixed3 color : COLOR;
				float3 worldNormal : TEXCOORD0;
			};

			// Vertex shading just need to pass the normal of world space to the fragment shading
			v2f vert(a2v v) {
				v2f o;
				// Transform the vertex from object space to projection space
				o.pos = UnityObjectToClipPos(v.vertex);

				// Transform the normal from object space to wrold space
				o.worldNormal = mul(v.normal, (float3x3)unity_WorldToObject);

				return o;
			}

			// Compute the diffuse illumination model
			fixed4 frag(v2f i) : SV_Target {
				// Get ambient term
				fixed3 ambient = UNITY_LIGHTMODEL_AMBIENT.xyz;

				// Get the normal in world space
				fixed3 worldNormal = normalize(i.worldNormal);
				// Get the light direction in world space
				fixed3 worldLightDir = normalize(_WorldSpaceLightPos0.xyz);

				// Compute diffuse term
				fixed3 diffuse = _LightColor0.rgb * _Diffuse.rgb * saturate(dot(worldNormal, worldLightDir));

				fixed3 color = ambient + diffuse;
				
				return fixed4(color, 1.0);
			}
			
			ENDCG
		}
	}
	Fallback "Diffuse"
}
