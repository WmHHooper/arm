// CSC 2110, Computer Organization
// Tutorial 0: The Raspberry Pi
// by William H. Hooper

// Computes the Nth Fibonacci number

int Fib(int i)
{
  int j, k;

  if (i < 2)
    return 1;

  j = Fib(i-1);
  k = Fib(i-2);
  return j + k;
}
