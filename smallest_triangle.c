// Student Author: Min Htut Myat 
// Student Number: 540207613
// Systems Programming Assignment 1
// Searcher Program

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <float.h>
#include <stdbool.h>

struct twoDPoint
{
  double X;
  double Y;
};

// Function prototypes
void isTriangle(double* sDist1, double* sDist2, double* sDist3);
void findClosestPoints(struct twoDPoint* points,int pSize,struct twoDPoint* closestPoints,double* sDist,double* sDist2,double* sDist3);

int main()
{
  
  double x;
  double y;
  int lines = 0; // lines read counter
  char line[50]; 

  // store valid 2D points
  struct twoDPoint coordinates[1000];
  struct twoDPoint closest3Points[3]; // store 3 closest 2D points

  // shortest distance for 3 closest points
  double shortestDist;
  double shortestDist2; 
  double shortestDist3; 

  // read a set of 2D points from generator program from stdin
  // both x and y must be valid floating point numbers 
  while (fgets(line, 50, stdin) != NULL)
  {
     int sResult = sscanf(line,"%lf, %lf", &x, &y);
     bool isValidPoint = true;
     int decPoints = 0;

     // Input validation checks
     // count number of decimal points present to check if it is valid floating point number
     for (int i = 0; i < 50; i++)
     {
        if(line[i] == '.')
        {
           decPoints++;
        }
     }
     // If there is more than 2 decimal point, one or more is not valid floating point number
     if(decPoints > 2)
     {
        isValidPoint = false;
        continue;
     }

     // skip lines which are not correct format -> is not a floating point number e.g. qwerqweo
     if(sResult == 0 || sResult == 1)
     {
        isValidPoint = false;
        continue;
     }
     // skip lines which are not correct format -> more than 2 floating point number e.g -3.45, 12.34, 23.08
     if (sResult > 2)
     {
        isValidPoint = false;
        getchar(); // clear buffer for scanf()
        continue;
     }
     // skip lines which are not correct format -> not 2 dp 
     if (x - (round(x * 100) / 100) > 0 || x - (round(x * 100) / 100) < 0)
     {
        isValidPoint = false;
        continue;
     }
     if (y - (round(y * 100) / 100) > 0 || y - (round(y * 100) / 100) < 0)
     {
        isValidPoint = false;
        continue;
     }
     // only first 1000 lines to be read
     if (lines == 1000)
     {
         break;
     }
     // not in range
     if (x < -50.00 || x > 50.00)
     {
        isValidPoint = false;
        continue;
     }
     if (y < -50.00 || y > 50.00)
     {
        isValidPoint = false;
        continue;
     }
     if (isValidPoint == true)
     {
        lines++;
        // populate to array of structs containing 2D points after passing validation checks
        coordinates[lines - 1].X = x;
        coordinates[lines - 1].Y = y;
     }
  }

  printf("read %d points\n", lines);
  // if input has lesser than 3 lines (lesser than 3 points), cannot make a triangle
  if (lines < 3)
  {
      int linecount = 0;
      while (linecount < lines)
      {
         printf("%.2lf, %.2lf\n", coordinates[linecount].X, coordinates[linecount].Y);
         linecount++;
      }
      printf("This is not a triangle\n");
      exit(1);
  }

  findClosestPoints(coordinates, lines, closest3Points, &shortestDist, &shortestDist2, &shortestDist3);
  isTriangle(&shortestDist, &shortestDist2, &shortestDist3);

  return 0;
}

// find 3 closest 2D points given a set of 2D Points
void findClosestPoints(struct twoDPoint* points,int pSize,struct twoDPoint* closestPoints,double* sDist,double* sDist2,double* sDist3)
{
  // For determining closest distances from 3 points
  double eDist;
  double eDist2;
  double eDist3;

 *sDist = DBL_MAX; 
 *sDist2 = DBL_MAX; 
 *sDist3 = DBL_MAX; 

  // find the closest 2Dpoints which gives the smallest distance (one side of triangle)
  int twop_Counteri = 0;
  while (twop_Counteri < pSize)
  {
      int twop_Counterj = twop_Counteri + 1;
      while (twop_Counterj < pSize)
      {
          // calcuate euclidean distance between any 2D points successfully read
          eDist = sqrt(pow(points[twop_Counteri].X - points[twop_Counterj].X, 2) + pow(points[twop_Counteri].Y - points[twop_Counterj].Y, 2));
          if (eDist < *sDist)
          {
              *sDist = eDist;
              closestPoints[0].X = points[twop_Counteri].X;
              closestPoints[0].Y = points[twop_Counteri].Y;

              closestPoints[1].X = points[twop_Counterj].X;
              closestPoints[1].Y = points[twop_Counterj].Y;
          } 
          twop_Counterj++;
      }
      twop_Counteri++;
  }


  // derive 3rd closest points from 2 points
  int threep_Counteri = 0;
  while (threep_Counteri < pSize)
  {
      int threep_Counterj = threep_Counteri + 1;
      while (threep_Counterj < pSize)
      {
          // don't include the 2 closest points found
          // allow if either x or y are the same for cases not forming triangle
          if ((points[threep_Counteri].X != closestPoints[0].X 
              || points[threep_Counteri].Y != closestPoints[0].Y)
              && (points[threep_Counteri].X != closestPoints[1].X
              || points[threep_Counteri].Y != closestPoints[1].Y)
              && (points[threep_Counterj].X != closestPoints[0].X
              || points[threep_Counterj].Y != closestPoints[0].Y)
              && (points[threep_Counterj].X != closestPoints[1].X
              || points[threep_Counterj].Y != closestPoints[1].Y))
          {
              eDist2 = sqrt(pow(points[threep_Counteri].X - closestPoints[0].X, 2) + pow(points[threep_Counteri].Y - closestPoints[0].Y, 2));
              eDist3 = sqrt(pow(points[threep_Counteri].X - closestPoints[1].X, 2) + pow(points[threep_Counteri].Y - closestPoints[1].Y, 2));
              // need to compare against the 2 points to derive the 3rd smallest point
              if (eDist2 < *sDist2 && eDist3 < *sDist3)
              {
                  *sDist2 = eDist2;
                  *sDist3 = eDist3;
                  closestPoints[2].X = points[threep_Counteri].X;
                  closestPoints[2].Y = points[threep_Counteri].Y;
              }
          }
          threep_Counterj++;
      }
      threep_Counteri++;
  }
 
  for (int i = 0; i < 3; i++)
  {
      printf("%.2lf, %.2lf\n", closestPoints[i].X, closestPoints[i].Y);
  }
}

// determine whether 3 closest points form a triangle 
void isTriangle(double* sDist1, double* sDist2, double* sDist3)
{
    // Heron's Formula
    double s = (*sDist1 + *sDist2 + *sDist3) / 2;
    double trianglearea = sqrt(s * (s - *sDist1) * (s - *sDist2 ) * (s - *sDist3));
    if (trianglearea > 0.001)
    {
        printf("This is a triangle\n");
    }
    else
    {
        printf("This is not a triangle\n");
    }
}