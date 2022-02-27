unit RGBHSV;
{
  William Egge, public@eggcentric.com
  http://www.eggcentric.com

  This unit converts between RGB and HSV color models.

  procedure HSVToRGB(const H, S, V: Single; out R, G, B: Single);
    in
    H = Hue.  Range is from 0..1.  0.5 = 180 degrees, 1 = 360. or H < 0 for gray
    S = Satration.  Range is 0..1 where 0 is white and 1 is no saturation.
    V = Value.  Range is 0..255

    out
    R = 0..255
    G = 0..255
    B = 0..255

    If H < 0 then the result is a gray value R=V, G=V, B=V

  procedure RGBToHSV(const R, G, B: Single; out H, S, V: Single);
    in
    R = 0..255
    G = 0..255
    B = 0..255

    out
    H = Hue. -1 for grey scale or range 0..1.  0..1 represents 0..360 degrees
    S = Saturation. Range = 0..1. 0 = white, 1 = no saturation.
    V = Value or intensity. Range 0..255
}

interface
uses
  Math;

procedure HSVToRGB(const H, S, V: Single; out R, G, B: Single);
procedure RGBToHSV(const R, G, B: Single; out H, S, V: Single);

implementation

procedure HSVToRGB(const H, S, V: Single; out R, G, B: Single);
const
  SectionSize = 60 / 360;
var
  Section: Single;
  SectionIndex: Integer;
  f: single;
  p, q, t: Single;
begin
  if H < 0 then
  begin
    R := V;
    G := R;
    B := R;
  end
  else
  begin
    Section := H / SectionSize;
    SectionIndex := Floor(Section);
    f := Section - SectionIndex;
    p := V * (1 - S);
    q := V * (1 - S * f);
    t := V * (1 - S * (1 - f));
    case SectionIndex of
      0:
        begin
          R := V;
          G := t;
          B := p;
        end;
      1:
        begin
          R := q;
          G := V;
          B := p;
        end;
      2:
        begin
          R := p;
          G := V;
          B := t;
        end;
      3:
        begin
          R := p;
          G := q;
          B := V;
        end;
      4:
        begin
          R := t;
          G := p;
          B := V;
        end;
    else
      R := V;
      G := p;
      B := q;
    end;
  end;
end;

procedure RGBToHSV(const R, G, B: Single; out H, S, V: Single);
var
  RGB: array[0..2] of Single;
  MinIndex, MaxIndex: Integer;
  Range: Single;
begin
  RGB[0] := R;
  RGB[1] := G;
  RGB[2] := B;

  MinIndex := 0;
  if G < R then
    MinIndex := 1;

  if B < RGB[MinIndex] then
    MinIndex := 2;

  MaxIndex := 0;
  if G > R then
    MaxIndex := 1;

  if B > RGB[MaxIndex] then
    MaxIndex := 2;

  Range := RGB[MaxIndex] - RGB[MinIndex];

  // Check for a gray level
  if Range = 0 then
  begin
    H := -1; // Can't determine on greys, so set to -1
    S := 0; // Gray is at the center;
    V := R; // could choose R, G, or B because they are all the same value.
  end
  else
  begin
    case MaxIndex of
      0: H := (G - B) / Range;
      1: H := 2 + (B - R) / Range;
      2: H := 4 + (R - G) / Range;
    end;
    S := Range / RGB[MaxIndex];
    V := RGB[MaxIndex];
    H := H * (1 / 6);
    if H < 0 then
      H := 1 + H;
  end;
end;

end.

