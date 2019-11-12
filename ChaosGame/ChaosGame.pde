float PointWidth = 1;
int Iterations = 100;
int Iteration = 0;
int DrawsPerIteration = 130000;
PGraphics StatsText;
float Jump = 1;
int AllowRepeats = 1;


void setup()
{
  noLoop();
  background(#ffffff);
  size(30000, 30000);

  surface.setTitle("Chaos Tringle");
  //Draw starting points.
  //DrawPoint(Point1, color(255, 0, 255));
  //DrawPoint(Point2, color(255, 0, 255));
  //DrawPoint(Point3, color(255, 0, 255));
  StatsText = createGraphics(128, 50);
  loop();
}

void draw()
{
  PVector CurrentPos = new PVector(width * .5, height * .5);
  PVector Vertecies[] = {
    new PVector(width * .5, 0), 
    new PVector(0, height), 
    new PVector(width, height), 
    //new PVector(0, 0), 
    //new PVector(width * .5, height * .5), 
    //new PVector(width, 0), 
  };
  PVector LastVertex = new PVector();
  PVector ChosenVert = Vertecies[int(random(0, Vertecies.length))];
  if (Iteration <= Iterations)
  {
    for (int TimesDrawn = 0; TimesDrawn <= DrawsPerIteration; TimesDrawn++)
    {
      ChosenVert = Vertecies[int(random(0, Vertecies.length))];
      if (AllowRepeats == 0)
      {
        while (ChosenVert == LastVertex)
        {
          ChosenVert = Vertecies[int(random(0, Vertecies.length))];
        }
      }
      CurrentPos = FindMidPoint(CurrentPos, ChosenVert);
      DrawPoint(CurrentPos, #FF0000);
      LastVertex = ChosenVert;
      //delay(1);
    }
    print("Dots Drawn : " + (DrawsPerIteration * Iteration) + " | " + ((float(Iteration) / float(Iterations)) * 100) + "%\n");
    Iteration++;
  } else
  {
    noLoop();
    save("Finished.png");
  }
}


void DrawPoint(PVector Pos, color Color)
{
  noStroke();
  //stroke(#FF03F3);
  fill(Color);
  ellipse(Pos.x, Pos.y, PointWidth, PointWidth);
  //point(Pos.x, Pos.y);
}

PVector FindMidPoint(PVector Point1, PVector Point2)
{
  //return (new PVector(((Point1.x - Point2.x) * Jump) + Point1.x, ((Point1.y - Point2.y) * Jump) + Point1.y));
  return (new PVector ((Point1.x + Point2.x) / 2, (Point1.y + Point2.y) / 2));
}
