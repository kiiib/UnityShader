// Upgrade NOTE: replaced 'mul(UNITY_MATRIX_MVP,*)' with 'UnityObjectToClipPos(*)'

Shader "Unity Shader Book/Chapter 5/Simple Shader" {
	SubShader {
		Pass {
			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag

			// 使用一个结构体来定义vertex shader的输入
			// application to vertex shader
			struct a2v {
				// Unity was told by POSITION's semantic, use vertex coordinate in model space fill in the vertex variable
				float4 vertex : POSITION;
				// Unity was told by NORMAL's semantic, use normal direction in model space fill in the normal variable
				float3 normal : NORMAL;
				// Unity was told by TEXCOORD0's semantic, use first texture coordinate fill in the texcoord variable
				float4 texcoord : TEXCOORD0;
			};

			// 使用一个结构体来定义fragment shader的输入
			// vertex shader to fragment shader
			struct v2f {
				// Unity was told by SV_POSITION semantic, "pos" includes the location info. of vertex in clip space
				float4 pos : SV_POSITION;
				// COLOR0 semantic can be use to store color info.
				fixed3 color : COLOR0;
			};

			v2f vert(a2v v) {
				// Declare the output struct
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);
				// v.normal includes the normal direction of vertex, its range in [-1.0, 1.0]
				// the code below mapping the range to [0.0, 1.0]
				// store into o.color and send to fragment shader
				o.color = v.normal * 0.5 + fixed3(0.5, 0.5, 0.5);
				return o;
			}
			fixed4 frag(v2f i) : SV_Target {
				// show the i.color which after interpolation in the monitor
				return fixed4(i.color, 1.0);
			}
			
			ENDCG
		}
	}
}