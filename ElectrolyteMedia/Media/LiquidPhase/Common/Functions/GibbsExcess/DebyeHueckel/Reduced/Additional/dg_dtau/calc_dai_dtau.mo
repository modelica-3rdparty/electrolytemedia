within ElectrolyteMedia.Media.LiquidPhase.Common.Functions.GibbsExcess.DebyeHueckel.Reduced.Additional.dg_dtau;
function calc_dai_dtau "Helper function to calculate Gibbs derivative"
  input SI.Temperature T;
  input SI.Pressure p;
  input SI.MassFraction X[nLfun];
  output Real dai_dT[nLfun-1];

protected
  Real[nLfun-1] m_i = calc_mfromX(X);
  Real[nLfun - 1] loggamma=calc_loggamma_i(
                  T,
                  p,
                  X);
  Real[nLfun - 1] dloggamma_dT=calc_dloggamma_dtau(T,p,X);

algorithm
  for i in 1:nLfun-1 loop
  dai_dT[i] := m_i[i] * log(10) * 10^(loggamma[i]) * dloggamma_dT[i];
  end for;

end calc_dai_dtau;
