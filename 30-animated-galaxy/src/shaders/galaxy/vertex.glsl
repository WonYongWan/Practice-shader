uniform float uTime;
uniform float uSize;

attribute float aScale;
attribute vec3 aRandomness;

varying vec3 vColor;

void main()
{
  /**
   * Position
   */
  vec4 modelPosition = modelMatrix * vec4(position, 1.0);

  // Spin
  float angle = atan(modelPosition.x, modelPosition.z);
  float distanceToCenter = length(modelPosition.xz);
  float angleOffset = (1.0 / distanceToCenter) * uTime * 0.2;
  angle += angleOffset;
  modelPosition.x = cos(angle) * distanceToCenter;
  modelPosition.z = sin(angle) * distanceToCenter;

  // Randomness
  modelPosition.xyz += aRandomness;

  vec4 viewPosition = viewMatrix * modelPosition;
  vec4 projectedPosition = projectionMatrix * viewPosition;
  gl_Position = projectedPosition;

  /**
   * Size
   */
  gl_PointSize = uSize * aScale;
  gl_PointSize *= (1.0 / - viewPosition.z); // 카메라와의 거리에 따라 Point 크기를 원근감 있게 조절, 멀어질수록 Point가 작아지도록 원근 보정

  /**
   * Color
   */
  vColor = color;
}