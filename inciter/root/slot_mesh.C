// File mesh with control file as slot_cyl_clf.q 
// input at slot_cyl_cfl_pe1_u0.0.std.exo
// Demonstrates usage of Visualization of Data from ROOT, linked with Quinoa.
//
// \author Matevz Tadel, Aditya Pakki
// code tutorial available at: https://root.cern.ch/doc/v608/triangleset_8C.html
// run code by going to root and executing it by .x slot_mesh.C
// I/P 1 - points is a 3 column space separated file, storing the coordinates of points
// I/P 2 - slots.triang is a multi format file to store vertices and connectivity.

#include <TEveManager.h>
#include <TEvePointSet.h>
#include <TEveRGBAPalette.h>
#include <TColor.h>
#include <TRandom.h>
#include <TMath.h>

#include <fstream>
#include <sstream>
#include <vector>
#include <string>

void ReadFile( const char* );

//Forward declaration
class TEveTriangleSet;
TEveTriangleSet *ts1=0;
std::vector<Double_t> pointSet;


void
slot_mesh(Int_t npoints = 512, TEveElement* parent=0)
{
  ReadFile("points");

  TEveManager::Create();
  
  // render the meshes
  ts1 = TEveTriangleSet::ReadTrivialFile("slot.triang");
  ts1->SetName("triangles");
  ts1->GenerateTriangleNormals();
  ts1->SetMainColor(4);
  TGeoHMatrix m;
  Double_t scale[3] = { 1.0, 1.0, 1.0 };
  m.SetScale(scale);
  ts1->SetTransMatrix(m);

  if (!gRandom)
    gRandom = new TRandom(0);
  TRandom& r= *gRandom;

  // name and display the vertices
  TEvePointSet* ps = new TEvePointSet();
  ps->SetOwnIds(kTRUE);

  int count = 1;
  for(std::vector<Double_t>::iterator itr = pointSet.begin(); 
      itr != pointSet.end(); itr += 3 ) {
    ps->SetNextPoint( *itr, *( itr+1 ), *( itr+2 ) );
    ps->SetPointId(new TNamed(Form("Point %d", count), ""));
    count += 1;
  }

  // properties of the image
  ps->SetMarkerColor(TMath::Nint(r.Uniform(2, 9)));
  ps->SetMarkerSize(r.Uniform(1));
  ps->SetMarkerStyle(6);

  if (parent) {
    parent->AddElement(ps);
  } else {
      gEve->AddElement(ps);
      gEve->Redraw3D(kTRUE);
      gEve->AddElement(ts1);
  }

}

// Reading the file word by word, line by line.
// Redundant function if vertices are not needed.
void
ReadFile(const char* file) {

  std::ifstream myfile( file, std::ifstream::in );
  std::string s, word;

  while( std::getline(myfile, s) )  {
    std::istringstream iss(s);
    while( iss >> word ) 
      pointSet.push_back( stod( word ) );
  }

}
