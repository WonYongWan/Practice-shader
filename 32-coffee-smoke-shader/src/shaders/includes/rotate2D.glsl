// 복잡한 함수가 void main위에 많아지면 성능 문제가 생길 수 있어 청크로 나눠 보관
vec2 rotate2D(vec2 value, float angle)
{
  float s = sin(angle);
  float c = cos(angle);
  mat2 m = mat2(c, s, -s, c);
  return m * value;
}