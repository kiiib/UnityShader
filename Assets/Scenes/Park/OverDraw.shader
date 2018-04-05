﻿Shader "Replacement/OverDraw"
{
SubShader
	{
		Tags { "Queue"="Transparent" }

		ZTest Always	// Aways do Depth test, do not consider Depth Buffer
		ZWrite Off	// Close Depth Buffer for drawing transparent objects
		// Above two line code effect this shader make all object becoming transparent

		Blend One One // Make color overlapping, the value more close to 1, more shine
		
		Pass
		{
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
			#include "UnityCG.cginc"

			struct appdata
			{
				float4 vertex : POSITION;
			};

			struct v2f
			{
				float4 vertex : SV_POSITION;
			};

			v2f vert (appdata v)
			{
				v2f o;
				o.vertex = UnityObjectToClipPos(v.vertex);
				return o;
			}

			half4 _OverDrawColor;
			
			fixed4 frag (v2f i) : SV_Target
			{
				return _OverDrawColor;
			}
			ENDCG
		}
	}
}
