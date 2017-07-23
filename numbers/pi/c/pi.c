/*
 * Created:  Sat 22 Jul 2017 04:07:20 PM PDT
 * Modified: Sun 23 Jul 2017 01:11:21 PM PDT
 *
 * Copyright 2017 (C) Robert Gill
 *
 * Calculate PI based on Rubinowitz & Wagon's spigot algorithm.
 * Code based on example Pascal code in their article.
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

static int *
init_spigot(int len)
{
  int *buf;

  buf = (int *) malloc (sizeof (int) * len);
  if (buf != NULL)
    for (int i = 0; i < len; i++) buf[i] = 2;
  return buf;
}

static int
next_pi_digit(int buf[], int len)
{
  static bool firstrun = true;
  static int predigit = 0, nines = 0;
  static int quot = 0, prod = 0;
  int rv = 0;

  if (nines != 0)
    {
      nines -= 1;
      return 9;
    }

skipfirst:
  do
    {
      for (int i = len; i > 0; i--)
        {
          prod = 10 * buf[i-1] + quot * i;
          buf[i-1] = prod % (2 * i - 1);
          quot = prod / (2 * i - 1);
        }

      buf[0] = quot % 10;
      quot = quot / 10;
      if (quot == 9) nines += 1;
    } while (quot == 9);

  if (quot == 10)
    {
      rv = predigit + 1;
      predigit = 0;
      nines = 0;
    }
  else
    {
      rv = predigit;
      predigit = quot;
    }

  /* Don't need to prefix 3.xxx... with a '0'. */
  if (firstrun)
    {
      firstrun = false;
      goto skipfirst;
    }

  return rv;
}

int
main (int argc, char *argv[])
{
  int digits, len;
  int *buf;

  if (argc < 2 || (digits = atoi(argv[1])) == 0)
    {
      printf ("USAGE: pi <NUMDIGITS>\n");
      exit (EXIT_SUCCESS);
    }

  len = 10 * digits / 3;
  if ((buf = init_spigot (len)) == NULL)
    {
      fprintf (stderr, "Unable to allocate required memory!\n");
      exit (EXIT_FAILURE);
    }

  for (int i = 0; i < digits; i++)
    {
      printf ("%d", next_pi_digit(buf, len));
      if (i < 1) printf (".");
    }

  printf ("\n");
  return 0;
}
