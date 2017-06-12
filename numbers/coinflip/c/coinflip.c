/*
 * Created:  Sun 11 Jun 2017 06:01:37 PM PDT
 * Modified: Sun 11 Jun 2017 06:20:38 PM PDT
 *
 * Copyright 2017 (C) Robert Gill
 *
 */

#include <stdio.h>
#include <stdlib.h>
#include <time.h>

enum {
    HEADS,
    TAILS
};
static int tally[2];

int
flip_coin (void)
{
  return (int) (2.0 * (rand () / (RAND_MAX + 1.0)));
}

int
main (int argc, char *argv[])
{
  srand (time (NULL));
  if (argc < 2)
    {
      printf ("USAGE: coinflip <NUM FLIPS>\n");
      exit (EXIT_FAILURE);
    }

  for (int i = 0; i < atoi (argv[1]); i++)
    tally[flip_coin ()] += 1;

  printf ("Totals:\n  HEADS: %d\n  TAILS: %d\n\n", tally[HEADS], tally[TAILS]);
  return EXIT_SUCCESS;
}
