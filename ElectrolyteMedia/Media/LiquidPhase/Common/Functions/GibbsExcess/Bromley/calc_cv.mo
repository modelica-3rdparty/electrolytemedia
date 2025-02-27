﻿within ElectrolyteMedia.Media.LiquidPhase.Common.Functions.GibbsExcess.Bromley;
function calc_cv
  "Calculates specific excess heat capacity of liquid species with Debye Hückel model"
  input SI.Temperature T;
  input SI.Pressure p;
  input SI.MassFraction[nLfun] X;
  output SI.SpecificHeatCapacityAtConstantVolume[nLfun] cv;
protected
  GibbsDerivs[nLfun] g = Reduced.GibbsDerivs(T,p,X);
  ThermoProperties_pT[nLfun] pro;
algorithm
  for i in 1:nLfun loop
    if i == nLfun or datafun[min(i,nLfun-1)].z <> 0 and X[i] > 0 then
      pro[i] :=Modelica.Media.Common.ThermoFluidSpecial.gibbsToProps_pT(g[i]);
      cv[i] :=pro[i].cv;
    end if;
  end for;

end calc_cv;
