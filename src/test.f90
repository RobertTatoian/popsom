! test harness for vsom
program test
    implicit none

    integer,parameter :: xdim=15,ydim=10,dd=4,dl=150,train=10000,debug=0
    real*4,parameter :: alpha = 0.6
    real*4 :: neurons(1:xdim*ydim*dd)
    real*4 :: train_data(1:dl*dd)

        neurons = (/ 0.742678227368742, &
            -0.867057161405683, &
            0.447455823421478, &
            0.0387807604856789, &
            0.676550273317844, &
            0.494589873123914, &
            -0.280004704836756, &
            -0.198764637578279, &
            0.703434228431433, &
            -0.958668256178498, &
            -0.558454423677176, &
            0.172813740558922, &
            -0.142885108012706, &
            -0.739089538808912, &
            0.370389713905752, &
            0.732286548241973, &
            0.233358594123274, &
            0.457804377190769, &
            0.931293855421245, &
            -0.408474520780146, &
            -0.549628094770014, &
            0.071137405000627, &
            -0.586705861613154, &
            0.107598533853889, &
            0.0376957315020263, &
            -0.253953382372856, &
            0.981490569654852, &
            -0.538398901931942, &
            -0.189977798610926, &
            0.815245827194303, &
            -0.511534950695932, &
            -0.33396110124886, &
            0.277045024558902, &
            -0.63967544818297, &
            0.547258329112083, &
            0.411732667591423, &
            0.280049293767661, &
            0.218087027780712, &
            -0.763182665687054, &
            -0.888011930510402, &
            0.486660126131028, &
            0.391778010874987, &
            -0.26602790132165, &
            0.884997631888837, &
            0.823218959849328, &
            -0.0525675844401121, &
            0.401421311777085, &
            -0.531513872090727, &
            0.817822024226189, &
            0.101162279956043, &
            0.475171924568713, &
            -0.0287091787904501, &
            0.65762939164415, &
            0.871042295824736, &
            0.298824701458216, &
            -0.621087762992829, &
            0.46428593667224, &
            0.356610248330981, &
            -0.618564915377647, &
            0.465703918132931, &
            -0.745241490658373, &
            0.501793129369617, &
            0.651099514681846, &
            0.368881775997579, &
            -0.906075124628842, &
            -0.242820788640529, &
            0.818475106731057, &
            0.0965289548039436, &
            -0.613156498875469, &
            0.698048820719123, &
            0.694801635574549, &
            -0.473292947281152, &
            0.422496796119958, &
            -0.771603159606457, &
            0.843971899710596, &
            -0.225751623976976, &
            -0.348280265927315, &
            -0.690710244234651, &
            -0.0333680347539485, &
            -0.683034394867718, &
            0.644197766669095, &
            -0.505323993042111, &
            0.944402347318828, &
            -0.358308082446456, &
            -0.871496133506298, &
            -0.974338077474385, &
            0.47232429869473, &
            0.158760323189199, &
            0.978903301525861, &
            0.266541623044759, &
            0.0400198991410434, &
            -0.38783799437806, &
            -0.0773212821222842, &
            0.740955566987395, &
            0.138768963515759, &
            0.456365407444537, &
            0.190224359743297, &
            -0.455813344568014, &
            0.0301535492762923, &
            -0.128359774593264, &
            -0.307088766247034, &
            -0.631843542680144, &
            0.0796212372370064, &
            -0.41761286277324, &
            -0.980225436389446, &
            0.965987878851593, &
            -0.559314349666238, &
            -0.507544973865151, &
            -0.729027463123202, &
            0.0121668186038733, &
            0.184656740166247, &
            -0.280393379274756, &
            -0.140195094980299, &
            -0.130249107722193, &
            -0.187162693589926, &
            0.0264784614555538, &
            0.293502167798579, &
            0.758758239913732, &
            -0.625574000179768, &
            0.472590705379844, &
            -0.285596436355263, &
            -0.97250104136765, &
            0.4827860314399, &
            0.967715327627957, &
            -0.26117354631424, &
            -0.863362051080912, &
            -0.56179956253618, &
            0.943758402019739, &
            0.686536476947367, &
            0.719558956567198, &
            -0.670941525138915, &
            -0.170024335384369, &
            -0.366967407986522, &
            -0.529112092684954, &
            -0.442888794932514, &
            0.296699375845492, &
            -0.732987099792808, &
            -0.622531028464437, &
            -0.0535509870387614, &
            -0.666677615605295, &
            0.338676100131124, &
            0.924993444699794, &
            0.150982475373894, &
            0.292851716745645, &
            0.108923394232988, &
            0.056355182081461, &
            -0.636138870380819, &
            0.359481537714601, &
            -0.0816098223440349, &
            0.62304295739159, &
            0.478133493103087, &
            -0.378078501671553, &
            -0.46631452254951, &
            -0.0415522749535739, &
            0.632069319952279, &
            0.0400371490977705, &
            -0.552400067448616, &
            0.45119655970484, &
            0.839596298988909, &
            0.85350604634732, &
            0.207161543425173, &
            -0.251128303818405, &
            -0.359667620621622, &
            -0.51992865325883, &
            0.867327671032399, &
            0.87720216345042, &
            -0.407245514914393, &
            0.451766084879637, &
            0.0138580338098109, &
            0.86662749061361, &
            0.733679614495486, &
            -0.171648820396513, &
            -0.632935905829072, &
            -0.517255982849747, &
            0.991234901826829, &
            -0.953279067296535, &
            -0.577601455617696, &
            -0.873985029291362, &
            -0.807188160717487, &
            0.667693421244621, &
            0.125857080332935, &
            0.744499845430255, &
            -0.359052123036236, &
            -0.532063933089375, &
            -0.290756484027952, &
            0.0790046132169664, &
            0.132849474437535, &
            0.963075587060302, &
            -0.700166300870478, &
            0.481928121764213, &
            0.661931794602424, &
            -0.816176701337099, &
            -0.1556242313236, &
            -0.317423473112285, &
            0.202592978253961, &
            0.0724228830076754, &
            -0.864397350233048, &
            0.875636848155409, &
            0.211378354113549, &
            -0.0152083565481007, &
            -0.0307786730118096, &
            -0.0423285751603544, &
            -0.870110563933849, &
            0.140710374340415, &
            0.143236541189253, &
            -0.97701604757458, &
            -0.701465635560453, &
            -0.264057229273021, &
            -0.664640532340854, &
            -0.331891934853047, &
            0.281355921179056, &
            0.826372920069844, &
            -0.350796627812088, &
            0.0936527377925813, &
            -0.167061927728355, &
            0.460398411843926, &
            -0.346682173199952, &
            -0.537328732665628, &
            -0.741037829313427, &
            -0.762399634346366, &
            0.0981452614068985, &
            -0.701563465874642, &
            -0.589811483863741, &
            -0.109573787078261, &
            0.804760781116784, &
            0.451543866191059, &
            -0.946803817525506, &
            -0.724674395751208, &
            -0.313045135233551, &
            0.378989822696894, &
            0.205886432901025, &
            0.664142393507063, &
            -0.342458427883685, &
            -0.645035536028445, &
            0.994263288099319, &
            0.142211894039065, &
            -0.367608110420406, &
            0.120391350705177, &
            0.467359134461731, &
            -0.184958999976516, &
            -0.998377524316311, &
            0.240920734591782, &
            -0.629634392913431, &
            0.87179587315768, &
            0.426066135987639, &
            -0.146847774740309, &
            0.231593003962189, &
            -0.634450513403863, &
            -0.781727288383991, &
            -0.81660319166258, &
            -0.529330811928958, &
            0.787422699388117, &
            -0.230275944340974, &
            -0.892978087998927, &
            -0.386584340129048, &
            -0.818571717478335, &
            -0.00506529165431857, &
            0.333271102048457, &
            -0.520322756841779, &
            0.65997807867825, &
            -0.511657628696412, &
            0.099505081307143, &
            0.699655771721154, &
            0.477403535507619, &
            -0.891481454018503, &
            -0.65390996215865, &
            -0.989029529970139, &
            -0.555070393253118, &
            0.677477100864053, &
            0.210662967525423, &
            0.918551734182984, &
            -0.529927626717836, &
            0.157541251275688, &
            0.0269081084989011, &
            -0.2374810539186, &
            -0.952774764969945, &
            0.984669986180961, &
            -0.934981407597661, &
            -0.561001544352621, &
            -0.187902775593102, &
            -0.144839480984956, &
            0.183825126383454, &
            -0.112227204721421, &
            0.193245759699494, &
            0.876281138975173, &
            0.39184130448848, &
            0.579191389027983, &
            0.797614632640034, &
            0.479726376477629, &
            0.156652263831347, &
            0.772959269583225, &
            -0.769354443997145, &
            0.04665139131248, &
            0.517703704535961, &
            0.938757422380149, &
            -0.0418312489055097, &
            -0.525855693500489, &
            -0.920519610866904, &
            -0.71699333563447, &
            0.412997156381607, &
            0.595117305405438, &
            0.687882241792977, &
            -0.504252966027707, &
            -0.385113460943103, &
            0.103650813922286, &
            0.927759557496756, &
            -0.923794696107507, &
            0.165546823758632, &
            0.0359423402696848, &
            0.737766096368432, &
            0.574003355111927, &
            -0.241968002170324, &
            0.446268715895712, &
            0.384442531038076, &
            0.522375686559826, &
            0.414714535232633, &
            -0.00640071043744683, &
            -0.0778774451464415, &
            0.3674022606574, &
            0.720529380254447, &
            -0.279724295251071, &
            0.838925702497363, &
            -0.831884848885238, &
            -0.0696799987927079, &
            0.0298758647404611, &
            -0.626610868610442, &
            0.0174750275909901, &
            -0.926134443841875, &
            -0.349718456622213, &
            -0.664523085579276, &
            -0.447513771243393, &
            -0.642200521659106, &
            0.777526050340384, &
            0.318998688831925, &
            0.480461742263287, &
            0.673349751159549, &
            0.624249250628054, &
            -0.823358983267099, &
            0.606615033000708, &
            -0.584556321147829, &
            0.819044204894453, &
            -0.660046693868935, &
            0.826364784501493, &
            -0.790343591943383, &
            -0.178619344253093, &
            0.426050210837275, &
            -0.810761020984501, &
            0.75548126315698, &
            0.910842821467668, &
            0.0580517291091383, &
            0.965400434099138, &
            0.0892439517192543, &
            -0.0725868553854525, &
            0.545878196600825, &
            0.0803875494748354, &
            -0.0834743678569794, &
            0.867666175588965, &
            -0.429710790049285, &
            0.712172674015164, &
            -0.166984328068793, &
            -0.811483894474804, &
            -0.92808129126206, &
            -0.739948962349445, &
            0.300076712388545, &
            0.266779409721494, &
            0.817475358955562, &
            0.229880861006677, &
            -0.929944032337517, &
            -0.886755783576518, &
            -0.589334672316909, &
            0.479981499258429, &
            0.256344102323055, &
            0.891605988144875, &
            0.783760378602892, &
            -0.363387933466583, &
            0.588680122978985, &
            0.773891815915704, &
            0.350258174352348, &
            -0.0425090966746211, &
            -0.0387844331562519, &
            -0.198917361907661, &
            0.643576341215521, &
            -0.930507752113044, &
            0.555022527463734, &
            0.403724287170917, &
            0.374702672939748, &
            0.123175852932036, &
            -0.7162901093252, &
            -0.459216009825468, &
            -0.927383457776159, &
            0.511990247294307, &
            -0.887143389787525, &
            0.234214404132217, &
            -0.12273102812469, &
            0.667034715414047, &
            0.579880231060088, &
            -0.269403530284762, &
            0.0705836601555347, &
            -0.294469224754721, &
            0.494733809493482, &
            -0.961029277183115, &
            -0.940453799441457, &
            -0.825361947529018, &
            -0.525072421412915, &
            0.348270434420556, &
            -0.0809572604484856, &
            -0.142858876381069, &
            -0.474398815538734, &
            -0.0119235166348517, &
            -0.55887386854738, &
            0.436631776858121, &
            -0.030995849519968, &
            -0.931010965723544, &
            0.491916114464402, &
            -0.193552017677575, &
            0.338179408572614, &
            -0.0268227569758892, &
            0.144445565063506, &
            0.9186100512743, &
            -0.23088818276301, &
            0.312371801584959, &
            -0.651793811935931, &
            0.545219750143588, &
            0.730148765724152, &
            -0.600193753838539, &
            -0.872094430029392, &
            0.621114428620785, &
            -0.14762636134401, &
            -0.402283641975373, &
            0.127368549350649, &
            0.930291587952524, &
            -0.511125768534839, &
            0.0866075945086777, &
            0.0378063023090363, &
            0.122262518387288, &
            -0.0414146659895778, &
            0.364890415221453, &
            -0.435867477674037, &
            -0.463069822639227, &
            -0.0039832484908402, &
            0.565215994603932, &
            0.354795408900827, &
            -0.0878865458071232, &
            -0.0514972349628806, &
            0.175864452961832, &
            -0.551819377113134, &
            0.131360600236803, &
            -0.0733808176591992, &
            0.816441718954593, &
            -0.606951920781285, &
            -0.0281291231513023, &
            0.185910822823644, &
            -0.551393033005297, &
            0.161245418246835, &
            -0.16952467430383, &
            0.657142482697964, &
            -0.564794228877872, &
            -0.873790241312236, &
            -0.974248328246176, &
            0.789296145085245, &
            0.455860893242061, &
            -0.803603280335665, &
            -0.257711586076766, &
            0.89874105155468, &
            0.598570559173822, &
            -0.27219971222803, &
            0.648831089027226, &
            0.603147408459336, &
            -0.0797128481790423, &
            0.107962687499821, &
            -0.404660524334759, &
            -0.0114239994436502, &
            -0.908936352934688, &
            -0.559885591734201, &
            -0.044228533282876, &
            0.831947613041848, &
            0.926545729395002, &
            -0.75489413831383, &
            0.657655688468367, &
            -0.257122859824449, &
            -0.528712596278638, &
            0.334790432825685, &
            -0.49028024636209, &
            0.258303810376674, &
            0.246115002781153, &
            0.69283664599061, &
            0.489839364308864, &
            0.311459776479751, &
            0.596412308979779, &
            0.597027129027992, &
            -0.426879581529647, &
            0.437148927245289, &
            0.826589083764702, &
            0.851449469104409, &
            0.847652878146619, &
            0.468272904399782, &
            0.465121493674815, &
            0.0843282979913056, &
            -0.433756899554282, &
            0.262254112400115, &
            0.100221046246588, &
            -0.214881465304643, &
            -0.599202620331198, &
            0.390237705316395, &
            0.319001289084554, &
            0.38642559805885, &
            0.50114446785301, &
            -0.180638721212745, &
            -0.804101490415633, &
            -0.0516063636168838, &
            0.193867314141244, &
            -0.861196560319513, &
            -0.777842123992741, &
            0.460998403839767, &
            -0.888155898544937, &
            -0.774600940290838, &
            -0.476284731179476, &
            0.38183922925964, &
            -0.659926556516439, &
            -0.876435613259673, &
            -0.677722817286849, &
            0.399462335277349, &
            0.116707173641771, &
            -0.380011602304876, &
            0.568359190132469, &
            -0.36558834835887, &
            0.366689813323319, &
            -0.260991341434419, &
            -0.27684003347531, &
            0.705207018181682, &
            -0.389973239973187, &
            0.81238391622901, &
            0.0853117224760354, &
            -0.945285291876644, &
            0.713373261969537, &
            -0.402088887058198, &
            0.510359099134803, &
            0.875000056810677, &
            0.343540769070387, &
            0.8575728260912, &
            -0.471842369064689, &
            -0.144780551083386, &
            -0.510403593070805, &
            0.722807458136231, &
            -0.652878315653652, &
            0.0314278854057193, &
            -0.440565270371735, &
            0.776597583200783, &
            -0.091958049684763, &
            -0.908642998430878, &
            0.787230115383863, &
            -0.495526372920722, &
            0.483897820115089, &
            0.842484037857503, &
            -0.268847556784749, &
            0.520314045716077, &
            -0.661810669582337, &
            -0.111309617757797, &
            -0.260285311378539, &
            -0.553848037030548, &
            0.625099701341242, &
            -0.111496553290635, &
            0.375243810005486, &
            -0.31977663654834, &
            0.987528927624226, &
            -0.235518919304013, &
            -0.030926963314414, &
            -0.903550282120705, &
            -0.22836881224066, &
            0.723230198957026, &
            0.621554706245661, &
            0.436410963069648, &
            -0.397049586754292, &
            0.10406134929508, &
            0.749405690934509, &
            -0.222990675829351, &
            -0.102301448583603, &
            0.181401723995805, &
            -0.849887295626104, &
            0.896150757092983, &
            0.303936999756843, &
            -0.128784849774092, &
            0.374738296959549, &
            -0.646677227225155, &
            -0.093835735693574, &
            0.592994776088744, &
            -0.0301490402780473, &
            0.362500581890345, &
            -0.329568126704544, &
            -0.429472046438605, &
            -0.300070555880666, &
            -0.499510024208575, &
            -0.985231646336615, &
            0.810567738953978, &
            0.221806807909161, &
            0.508711403701454, &
            0.81662013521418, &
            -0.11750969151035, &
            -0.0725502809509635, &
            -0.77318693138659 &
            /) 

        train_data = (/ &
        5.1, &
        4.9, &
        4.7, &
        4.6, &
        5.0, &
        5.4, &
        4.6, &
        5.0, &
        4.4, &
        4.9, &
        5.4, &
        4.8, &
        4.8, &
        4.3, &
        5.8, &
        5.7, &
        5.4, &
        5.1, &
        5.7, &
        5.1, &
        5.4, &
        5.1, &
        4.6, &
        5.1, &
        4.8, &
        5.0, &
        5.0, &
        5.2, &
        5.2, &
        4.7, &
        4.8, &
        5.4, &
        5.2, &
        5.5, &
        4.9, &
        5.0, &
        5.5, &
        4.9, &
        4.4, &
        5.1, &
        5.0, &
        4.5, &
        4.4, &
        5.0, &
        5.1, &
        4.8, &
        5.1, &
        4.6, &
        5.3, &
        5.0, &
        7.0, &
        6.4, &
        6.9, &
        5.5, &
        6.5, &
        5.7, &
        6.3, &
        4.9, &
        6.6, &
        5.2, &
        5.0, &
        5.9, &
        6.0, &
        6.1, &
        5.6, &
        6.7, &
        5.6, &
        5.8, &
        6.2, &
        5.6, &
        5.9, &
        6.1, &
        6.3, &
        6.1, &
        6.4, &
        6.6, &
        6.8, &
        6.7, &
        6.0, &
        5.7, &
        5.5, &
        5.5, &
        5.8, &
        6.0, &
        5.4, &
        6.0, &
        6.7, &
        6.3, &
        5.6, &
        5.5, &
        5.5, &
        6.1, &
        5.8, &
        5.0, &
        5.6, &
        5.7, &
        5.7, &
        6.2, &
        5.1, &
        5.7, &
        6.3, &
        5.8, &
        7.1, &
        6.3, &
        6.5, &
        7.6, &
        4.9, &
        7.3, &
        6.7, &
        7.2, &
        6.5, &
        6.4, &
        6.8, &
        5.7, &
        5.8, &
        6.4, &
        6.5, &
        7.7, &
        7.7, &
        6.0, &
        6.9, &
        5.6, &
        7.7, &
        6.3, &
        6.7, &
        7.2, &
        6.2, &
        6.1, &
        6.4, &
        7.2, &
        7.4, &
        7.9, &
        6.4, &
        6.3, &
        6.1, &
        7.7, &
        6.3, &
        6.4, &
        6.0, &
        6.9, &
        6.7, &
        6.9, &
        5.8, &
        6.8, &
        6.7, &
        6.7, &
        6.3, &
        6.5, &
        6.2, &
        5.9, &
        3.5, &
        3.0, &
        3.2, &
        3.1, &
        3.6, &
        3.9, &
        3.4, &
        3.4, &
        2.9, &
        3.1, &
        3.7, &
        3.4, &
        3.0, &
        3.0, &
        4.0, &
        4.4, &
        3.9, &
        3.5, &
        3.8, &
        3.8, &
        3.4, &
        3.7, &
        3.6, &
        3.3, &
        3.4, &
        3.0, &
        3.4, &
        3.5, &
        3.4, &
        3.2, &
        3.1, &
        3.4, &
        4.1, &
        4.2, &
        3.1, &
        3.2, &
        3.5, &
        3.6, &
        3.0, &
        3.4, &
        3.5, &
        2.3, &
        3.2, &
        3.5, &
        3.8, &
        3.0, &
        3.8, &
        3.2, &
        3.7, &
        3.3, &
        3.2, &
        3.2, &
        3.1, &
        2.3, &
        2.8, &
        2.8, &
        3.3, &
        2.4, &
        2.9, &
        2.7, &
        2.0, &
        3.0, &
        2.2, &
        2.9, &
        2.9, &
        3.1, &
        3.0, &
        2.7, &
        2.2, &
        2.5, &
        3.2, &
        2.8, &
        2.5, &
        2.8, &
        2.9, &
        3.0, &
        2.8, &
        3.0, &
        2.9, &
        2.6, &
        2.4, &
        2.4, &
        2.7, &
        2.7, &
        3.0, &
        3.4, &
        3.1, &
        2.3, &
        3.0, &
        2.5, &
        2.6, &
        3.0, &
        2.6, &
        2.3, &
        2.7, &
        3.0, &
        2.9, &
        2.9, &
        2.5, &
        2.8, &
        3.3, &
        2.7, &
        3.0, &
        2.9, &
        3.0, &
        3.0, &
        2.5, &
        2.9, &
        2.5, &
        3.6, &
        3.2, &
        2.7, &
        3.0, &
        2.5, &
        2.8, &
        3.2, &
        3.0, &
        3.8, &
        2.6, &
        2.2, &
        3.2, &
        2.8, &
        2.8, &
        2.7, &
        3.3, &
        3.2, &
        2.8, &
        3.0, &
        2.8, &
        3.0, &
        2.8, &
        3.8, &
        2.8, &
        2.8, &
        2.6, &
        3.0, &
        3.4, &
        3.1, &
        3.0, &
        3.1, &
        3.1, &
        3.1, &
        2.7, &
        3.2, &
        3.3, &
        3.0, &
        2.5, &
        3.0, &
        3.4, &
        3.0, &
        1.4, &
        1.4, &
        1.3, &
        1.5, &
        1.4, &
        1.7, &
        1.4, &
        1.5, &
        1.4, &
        1.5, &
        1.5, &
        1.6, &
        1.4, &
        1.1, &
        1.2, &
        1.5, &
        1.3, &
        1.4, &
        1.7, &
        1.5, &
        1.7, &
        1.5, &
        1.0, &
        1.7, &
        1.9, &
        1.6, &
        1.6, &
        1.5, &
        1.4, &
        1.6, &
        1.6, &
        1.5, &
        1.5, &
        1.4, &
        1.5, &
        1.2, &
        1.3, &
        1.4, &
        1.3, &
        1.5, &
        1.3, &
        1.3, &
        1.3, &
        1.6, &
        1.9, &
        1.4, &
        1.6, &
        1.4, &
        1.5, &
        1.4, &
        4.7, &
        4.5, &
        4.9, &
        4.0, &
        4.6, &
        4.5, &
        4.7, &
        3.3, &
        4.6, &
        3.9, &
        3.5, &
        4.2, &
        4.0, &
        4.7, &
        3.6, &
        4.4, &
        4.5, &
        4.1, &
        4.5, &
        3.9, &
        4.8, &
        4.0, &
        4.9, &
        4.7, &
        4.3, &
        4.4, &
        4.8, &
        5.0, &
        4.5, &
        3.5, &
        3.8, &
        3.7, &
        3.9, &
        5.1, &
        4.5, &
        4.5, &
        4.7, &
        4.4, &
        4.1, &
        4.0, &
        4.4, &
        4.6, &
        4.0, &
        3.3, &
        4.2, &
        4.2, &
        4.2, &
        4.3, &
        3.0, &
        4.1, &
        6.0, &
        5.1, &
        5.9, &
        5.6, &
        5.8, &
        6.6, &
        4.5, &
        6.3, &
        5.8, &
        6.1, &
        5.1, &
        5.3, &
        5.5, &
        5.0, &
        5.1, &
        5.3, &
        5.5, &
        6.7, &
        6.9, &
        5.0, &
        5.7, &
        4.9, &
        6.7, &
        4.9, &
        5.7, &
        6.0, &
        4.8, &
        4.9, &
        5.6, &
        5.8, &
        6.1, &
        6.4, &
        5.6, &
        5.1, &
        5.6, &
        6.1, &
        5.6, &
        5.5, &
        4.8, &
        5.4, &
        5.6, &
        5.1, &
        5.1, &
        5.9, &
        5.7, &
        5.2, &
        5.0, &
        5.2, &
        5.4, &
        5.1, &
        0.2, &
        0.2, &
        0.2, &
        0.2, &
        0.2, &
        0.4, &
        0.3, &
        0.2, &
        0.2, &
        0.1, &
        0.2, &
        0.2, &
        0.1, &
        0.1, &
        0.2, &
        0.4, &
        0.4, &
        0.3, &
        0.3, &
        0.3, &
        0.2, &
        0.4, &
        0.2, &
        0.5, &
        0.2, &
        0.2, &
        0.4, &
        0.2, &
        0.2, &
        0.2, &
        0.2, &
        0.4, &
        0.1, &
        0.2, &
        0.2, &
        0.2, &
        0.2, &
        0.1, &
        0.2, &
        0.2, &
        0.3, &
        0.3, &
        0.2, &
        0.6, &
        0.4, &
        0.3, &
        0.2, &
        0.2, &
        0.2, &
        0.2, &
        1.4, &
        1.5, &
        1.5, &
        1.3, &
        1.5, &
        1.3, &
        1.6, &
        1.0, &
        1.3, &
        1.4, &
        1.0, &
        1.5, &
        1.0, &
        1.4, &
        1.3, &
        1.4, &
        1.5, &
        1.0, &
        1.5, &
        1.1, &
        1.8, &
        1.3, &
        1.5, &
        1.2, &
        1.3, &
        1.4, &
        1.4, &
        1.7, &
        1.5, &
        1.0, &
        1.1, &
        1.0, &
        1.2, &
        1.6, &
        1.5, &
        1.6, &
        1.5, &
        1.3, &
        1.3, &
        1.3, &
        1.2, &
        1.4, &
        1.2, &
        1.0, &
        1.3, &
        1.2, &
        1.3, &
        1.3, &
        1.1, &
        1.3, &
        2.5, &
        1.9, &
        2.1, &
        1.8, &
        2.2, &
        2.1, &
        1.7, &
        1.8, &
        1.8, &
        2.5, &
        2.0, &
        1.9, &
        2.1, &
        2.0, &
        2.4, &
        2.3, &
        1.8, &
        2.2, &
        2.3, &
        1.5, &
        2.3, &
        2.0, &
        2.0, &
        1.8, &
        2.1, &
        1.8, &
        1.8, &
        1.8, &
        2.1, &
        1.6, &
        1.9, &
        2.0, &
        2.2, &
        1.5, &
        1.4, &
        2.3, &
        2.4, &
        1.8, &
        1.8, &
        2.1, &
        2.4, &
        2.3, &
        1.9, &
        2.3, &
        2.5, &
        2.3, &
        1.9, &
        2.0, &
        2.3, &
        1.8 /)

        write(*,*) 'Start...'
        call vsom(neurons,train_data,dl,dd,xdim,ydim,alpha,train,debug)
        write(*,*) 'Stop...'

end program  
