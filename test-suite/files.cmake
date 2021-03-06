# CMake build system for QuantLib 
# 2012, Joao Paulo Magalhaes <jpmagalhaes@ist.utl.pt>

set ( QuantLib_TEST_SRCS
	quantlibtestsuite.cpp 
	americanoption.hpp americanoption.cpp 
	array.hpp array.cpp 
	asianoptions.hpp asianoptions.cpp 
	assetswap.hpp assetswap.cpp 
	autocovariances.hpp autocovariances.cpp 
	barrieroption.hpp barrieroption.cpp 
	basketoption.hpp basketoption.cpp 
	batesmodel.hpp batesmodel.cpp 
	bermudanswaption.hpp bermudanswaption.cpp 
	blackdeltacalculator.hpp blackdeltacalculator.cpp 
	bonds.hpp bonds.cpp 
	brownianbridge.hpp brownianbridge.cpp 
	calendars.hpp calendars.cpp 
	capfloor.hpp capfloor.cpp 
	capflooredcoupon.hpp capflooredcoupon.cpp 
	cashflows.hpp cashflows.cpp 
	cdo.hpp cdo.cpp 
	cdsoption.hpp cdsoption.cpp 
	chooseroption.hpp chooseroption.cpp 
	cliquetoption.hpp cliquetoption.cpp 
	cms.hpp cms.cpp 
	commodityunitofmeasure.hpp commodityunitofmeasure.cpp 
	compoundoption.hpp compoundoption.cpp 
	convertiblebonds.hpp convertiblebonds.cpp 
	covariance.hpp covariance.cpp 
	creditdefaultswap.hpp creditdefaultswap.cpp 
	curvestates.hpp curvestates.cpp 
	dates.hpp dates.cpp 
	daycounters.hpp daycounters.cpp 
	defaultprobabilitycurves.hpp defaultprobabilitycurves.cpp 
	digitalcoupon.hpp digitalcoupon.cpp 
	digitaloption.hpp digitaloption.cpp 
	distributions.hpp distributions.cpp 
	dividendoption.hpp dividendoption.cpp 
	europeanoption.hpp europeanoption.cpp 
	everestoption.hpp everestoption.cpp 
	exchangerate.hpp exchangerate.cpp 
	extendedtrees.hpp extendedtrees.cpp 
	factorial.hpp factorial.cpp 
	fastfouriertransform.hpp fastfouriertransform.cpp 
	fdheston.hpp fdheston.cpp 
	fdmlinearop.hpp fdmlinearop.cpp 
	forwardoption.hpp forwardoption.cpp 
	gaussianquadratures.hpp gaussianquadratures.cpp 
	gjrgarchmodel.hpp gjrgarchmodel.cpp 
	hestonmodel.hpp hestonmodel.cpp 
	himalayaoption.hpp himalayaoption.cpp 
	hybridhestonhullwhiteprocess.hpp hybridhestonhullwhiteprocess.cpp 
	inflation.hpp inflation.cpp 
	inflationcapfloor.hpp inflationcapfloor.cpp 
	inflationcapflooredcoupon.hpp inflationcapflooredcoupon.cpp 
        inflationcpicapfloor.hpp inflationcpicapfloor.cpp 
	inflationcpiswap.hpp inflationcpiswap.cpp 
	inflationvolatility.hpp inflationvolatility.cpp 
	instruments.hpp instruments.cpp 
	integrals.hpp integrals.cpp 
	interestrates.hpp interestrates.cpp 
	interpolations.hpp interpolations.cpp 
	jumpdiffusion.hpp jumpdiffusion.cpp 
	libormarketmodel.hpp libormarketmodel.cpp 
	libormarketmodelprocess.hpp libormarketmodelprocess.cpp 
	linearleastsquaresregression.hpp linearleastsquaresregression.cpp 
	lookbackoptions.hpp lookbackoptions.cpp 
	lowdiscrepancysequences.hpp lowdiscrepancysequences.cpp 
	margrabeoption.hpp margrabeoption.cpp 
	marketmodel.hpp marketmodel.cpp 
	marketmodel_cms.hpp marketmodel_cms.cpp 
	marketmodel_smm.hpp marketmodel_smm.cpp 
        marketmodel_smmcapletalphacalibration.hpp marketmodel_smmcapletalphacalibration.cpp 
	marketmodel_smmcapletcalibration.hpp marketmodel_smmcapletcalibration.cpp 
	marketmodel_smmcaplethomocalibration.hpp marketmodel_smmcaplethomocalibration.cpp 
	matrices.hpp matrices.cpp 
	mclongstaffschwartzengine.hpp mclongstaffschwartzengine.cpp 
	mersennetwister.hpp mersennetwister.cpp 
	money.hpp money.cpp 
	nthtodefault.hpp nthtodefault.cpp 
	operators.hpp operators.cpp 
	optimizers.hpp optimizers.cpp 
	optionletstripper.hpp optionletstripper.cpp 
	overnightindexedswap.hpp overnightindexedswap.cpp 
	pagodaoption.hpp pagodaoption.cpp 
	pathgenerator.hpp pathgenerator.cpp 
	period.hpp period.cpp 
	piecewiseyieldcurve.hpp piecewiseyieldcurve.cpp 
	quantooption.hpp quantooption.cpp 
	quotes.hpp quotes.cpp 
	rangeaccrual.hpp rangeaccrual.cpp 
	riskstats.hpp riskstats.cpp 
	rngtraits.hpp rngtraits.cpp 
	rounding.hpp rounding.cpp 
	sampledcurve.hpp sampledcurve.cpp 
	schedule.hpp schedule.cpp 
	shortratemodels.hpp shortratemodels.cpp 
	solvers.hpp solvers.cpp 
	spreadoption.hpp spreadoption.cpp 
	stats.hpp stats.cpp 
	surface.hpp surface.cpp 
	swap.hpp swap.cpp 
	swapforwardmappings.hpp swapforwardmappings.cpp 
	swaption.hpp swaption.cpp 
	swaptionvolatilitycube.hpp swaptionvolatilitycube.cpp 
	swaptionvolatilitymatrix.hpp swaptionvolatilitymatrix.cpp 
	swaptionvolstructuresutilities.hpp 
	swingoption.hpp swingoption.cpp 
	termstructures.hpp termstructures.cpp 
	timeseries.hpp timeseries.cpp 
	transformedgrid.hpp transformedgrid.cpp 
	tqreigendecomposition.hpp tqreigendecomposition.cpp 
	tracing.hpp tracing.cpp 
	utilities.hpp utilities.cpp 
	variancegamma.hpp variancegamma.cpp 
	varianceoption.hpp varianceoption.cpp 
	varianceswaps.hpp varianceswaps.cpp 
	volatilitymodels.hpp volatilitymodels.cpp 
	vpp.hpp vpp.cpp 
	writerextensibleoption.hpp writerextensibleoption.cpp
)

set ( QuantLib_BENCHMARK_SRCS
	quantlibbenchmark.cpp 
	americanoption.hpp americanoption.cpp 
	asianoptions.hpp asianoptions.cpp 
	barrieroption.hpp barrieroption.cpp 
	basketoption.hpp basketoption.cpp 
	batesmodel.hpp batesmodel.cpp 
	convertiblebonds.hpp convertiblebonds.cpp 
	digitaloption.hpp digitaloption.cpp 
	dividendoption.hpp dividendoption.cpp 
	europeanoption.hpp europeanoption.cpp 
	fdheston.hpp fdheston.cpp 
	hestonmodel.hpp hestonmodel.cpp 
	interpolations.hpp interpolations.cpp 
	jumpdiffusion.hpp jumpdiffusion.cpp 
	lowdiscrepancysequences.hpp lowdiscrepancysequences.cpp 
	marketmodel_cms.hpp marketmodel_cms.cpp 
	marketmodel_smm.hpp marketmodel_smm.cpp 
	quantooption.hpp quantooption.cpp 
	riskstats.hpp riskstats.cpp 
	shortratemodels.hpp shortratemodels.cpp 
	utilities.hpp utilities.cpp
)

