Shader "Unity Shaders Book/Chapter 5/FalseColorImageShader" {
	SubShader {
		Pass {
			CGPROGRAM

			#pragma vertex vert
			#pragma fragment frag

			#include "UnityCG.cginc"

			struct v2f {
				float4 pos : SV_POSITION;
				fixed4 color : colorR0;
			};
			
			v2f vert(appdata_full v){
				v2f o;
				o.pos = UnityObjectToClipPos(v.vertex);
				
				// // visualization of the direction of normal
				 o.color = fixed4(v.normal * 0.5 + fixed3(0.5, 0.5, 0.5), 1.0);

				// // visualization of the direction of tangent
				// o.color = fixed4(v.tangent.xyz * 0.5 + fixed3(0.5, 0.5, 0.5), 1.0);

				// // visualization of the direction of bitangent（副切线）
				// fixed3 binormal = cross(v.normal, v.tangent.xyz) * v.tangent.w;
				// o.color = fixed4(binormal * 0.5 + fixed3(0.5, 0.5, 0.5), 1.0);

				// // visualization of the first texture coordinate
				// o.color = fixed4(v.texcoord.xy, 0.0, 1.0);

				// // visualization of the second texture coordinate
				// o.color = fixed4(v.texcoord1.xy, 0.0, 1.0);

				// // visualization of the decimal part of first texture
				// o.color = frac(v.texcoord);
				// if (any(saturate(v.texcoord) - v.texcoord)){
				// 	o.color.b = 0.5;
				// }
				// o.color.a = 1.0;

				// // visualization of the decimal part of second texture
				// o.color = frac(v.texcoord1);
				// if (any(saturate(v.texcoord1) - v.texcoord1)){
				// 	o.color.b = 0.5;
				// }
				// o.color.a = 1.0;

				// visualization of vertex color
				// o.color = v.color;

				return o;
			}

			fixed4 frag(v2f i) : SV_Target {
				return i.color;
			}
			
			ENDCG
		}
	}
}
