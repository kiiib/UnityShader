using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class ReplacementShaderCameraEffect : MonoBehaviour {

	public Shader ReplacementShader;
	public Color OverDrawColor;
	void OnValidate() {
		Shader.SetGlobalColor("_OverDrawColor", OverDrawColor);
	}

	void OnEnable(){
		if(ReplacementShader != null){
			GetComponent<Camera>().SetReplacementShader(ReplacementShader, "");
		}
	}

	void OnDisable() {
		GetComponent<Camera>().ResetReplacementShader();	
	}
}
