
// ARRI ALEXA IDT for ALEXA logC files
//  with camera EI set to 1000
//  and CCT of adopted white set to 3900K
// Written by v2_IDT_maker.py v0.05 on Tuesday 09 December 2014 by scott

float
normalizedLogC2ToRelativeExposure(float x) {
	if (x > 0.134495)
		return (pow(10,(x - 0.391007) / 0.244161) - 0.089004) / 5.061087;
	else
		return (x - 0.134495) / 4.684112;
}

void main
(	input varying float rIn,
	input varying float gIn,
	input varying float bIn,
	input varying float aIn,
	output varying float rOut,
	output varying float gOut,
	output varying float bOut,
	output varying float aOut)
{

	float r_lin = normalizedLogC2ToRelativeExposure(rIn);
	float g_lin = normalizedLogC2ToRelativeExposure(gIn);
	float b_lin = normalizedLogC2ToRelativeExposure(bIn);

	rOut = r_lin * 0.787080 + g_lin * 0.113686 + b_lin * 0.099234;
	gOut = r_lin * 0.058373 + g_lin * 1.055330 + b_lin * -0.113702;
	bOut = r_lin * 0.037626 + g_lin * -0.303743 + b_lin * 1.266117;
	aOut = 1.0;

}