Shader "Test/TimeAnimation" {
	Properties {
		
	}
	SubShader {
		Tags { "RenderType"="Opaque" }

		pass {
			CGPROGRAM
			#pragma vertex vs_main;
			#pragma fragment ps_main;

			#include "UnityCG.cginc"

			struct appdata
			{
				float vertex : POSITION;
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
			};

			v2f vs_main(appdata v)
			{
				v2f o;
				v.vertex = UnityObjectToClipPos(v.vertex);
				return o;
			}

			float my_time;

			float4 ps_main(v2f i) : SV_TARGET
			{
				
			}


			ENDCG
		}
		
	}
	FallBack "Diffuse"
}
