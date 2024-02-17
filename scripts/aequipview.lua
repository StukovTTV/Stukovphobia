require "scripts/style"

AEQstatColor = Color(58,58,58,255);

AeqCatNormalColor = Color(0,0,0,255);
AeqCatOverColor   = Color(0,0,0,255);
AeqCatDownColor   = Color(255,255,255,255);

AeqCatButtonFont = {
  "fonts/xenonauts.mvec",
  1,
  AeqCatNormalColor
};

AEQSelectorFont = {
  GeoscapeFont,
  1,
  BlackColor
};

AEQWeaponFont = {
  GeoscapeFont,
  1,
  WhiteColor
};

AEQWeaponFontBlack = {
  GeoscapeFont,
  1,
  BlackColor
};

AEQStatFont = {
  GeoscapeFont,
  1,
  AEQstatColor
};

AEQStatLinkFont = {
  GeoscapeFont,
  1,
  BlueLinkColor
};

AEQPercentFont = {
  GeoscapeFont,
  1,
  WhiteColor
};

CategoryButtonGraphics = {
	"ui_screens/ui_aircraft/buttonup",
	"ui_screens/ui_aircraft/buttondown",
	"ui_screens/ui_aircraft/buttonover",
	"ui_screens/ui_aircraft/buttondownover",
};

CategoryButtonStyle = {
	parent   = DefaultStyle,
	sound    = kDefaultButtonSound,
	type     = kRadio,
	graphics = CategoryButtonGraphics,
};

ScrollLeftButtonGraphics = {
	"uitextures/scrollleft",
	"uitextures/scrollleft_down",
	"uitextures/scrollleft_over",
};

ScrollRightButtonGraphics = {
	"uitextures/scrollright",
	"uitextures/scrollright_down",
	"uitextures/scrollright_over",
};

ScrollLeftButtonStyle = {
	parent   = DefaultStyle,
	sound    = kDefaultButtonSound,
	type     = kPush,
  graphics = ScrollLeftButtonGraphics,
	font     = XenonautsButtonFontLarge,
};

ScrollRightButtonStyle = {
	parent   = DefaultStyle,
	sound    = kDefaultButtonSound,
	type     = kPush,
  graphics = ScrollRightButtonGraphics,
	font     = XenonautsButtonFontLarge,
};

local maskTint = Color( 255, 255, 255, 255 );
local listTint = Color( 255, 255, 255, 255 );

local scl = ( hwh / 940 );

local stw = scl * 388;
local sth = scl * 542;

local wsh = scl * 600;
local wsw = wsh * 0.6;

local pbarcolor = Color(0,201,29,255);

local bigaspect = 640 / 500;
local bigheight = 9 * hwh / 10;
local bigwidth  = bigheight * bigaspect;

local wsaspect = 600 / 220;
local wsheight = hwh * 0.11;
local wswidth  = (wsheight * wsaspect) * 1;

local traspect = 1217 / 201;
local trheight = hwh * 0.21;
local trwidth  = trheight * traspect;

local tsaspect = 127 / 175;
local tsheight = trheight * 0.87;
local tswidth  = tsheight * tsaspect;
local tstop    = trheight * 0.069;
local tsleft   = trwidth * 0.038;
local tsspace  = trwidth * 0.013;

g_aeqpbarcolor = {
  color = pbarcolor,
}
g_aeqpbarheight = stw * 0.03;

AEQSelectorEditFont = {
  GeoscapeFont,
  stw * 0.07,
  BlackColor
};

MakeDialog
{
  AirplaneEquipView
  {
    name = "aequipview",

    x = 0,
    y = 0,
    w = kMax,
    h = kMax,
    
    NonUniformScaledImage
    {
      name  = "bigimage",
      x = kCenter,
      y = kCenter,
      w = bigwidth,
      h = bigheight,
      align = kHAlignCenter + kVAlignCenter,
      image = "uitextures/transparent",
      tint = maskTint;

      ScalingText
      {
        font = AEQPercentFont,
        name = "percentComplete",
        x = kCenter,
        y = kCenter,
        w = kMax,
        h = hwh * 0.1,
        fontScale = hwh * 0.05,
  	    flags = kHAlignCenter + kVAlignCenter,
        label = "<outline color='000000' size='2'>Unit Under Construction<br/>Engineer Hours Until Completion: XXX Hours</outline>",
      },
      ScalingText
      {
        font = AEQPercentFont,
        name = "noVehicles",
        x = kCenter,
        y = hwh * 0.3,
        w = kMax,
        h = hwh / 15,
        fontScale = hwh / 15,
  	    flags = kHAlignCenter + kVAlignCenter,
        label = "AEQ.NoAirplanes",
      },

      AirplaneWeaponSlot
      {
        name = "weaponSlot1",
      
        x = 0,
        y = 0,
        w = wswidth,
        h = wsheight,
        align = kHAlignRight + kVAlignTop,
      },
      AirplaneWeaponSlot
      {
        name = "weaponSlot3",
      
        x = 0,
        y = 0,
        w = wswidth,
        h = wsheight,
        align = kHAlignRight + kVAlignTop,
      },

      AirplaneWeaponSlot
      {
        name = "weaponSlot2",
      
        x = 0,
        y = 0,
        w = wswidth,
        h = wsheight,
        align = kHAlignRight + kVAlignBottom,
      },
      AirplaneWeaponSlot
      {
        name = "weaponSlot4",
      
        x = 0,
        y = 0,
        w = wswidth,
        h = wsheight,
        align = kHAlignRight + kVAlignBottom,
      },
    },

    TiledImage
    {
	    name  = "statpanel",
      x = 10,
      y = 110,
      w = stw,
      h = sth,
      image = "ui_screens/ui_stores/speechbubble",
      bordersize = 4,
      
      ScalingText
      {
        font = AEQSelectorFont,
        name = "vehiclename",
		    x = stw * 0.04,
        y = stw * 0.025,
        w = kMax,
        h = stw * 0.07,
  	    flags = kHAlignLeft + kVAlignCenter,
        label = "undefined",
			  fontScale = stw * 0.07,
		
      },
      ClearingTextEdit
      {
        font = AEQSelectorEditFont,
        name = "callsignedit",
        x = stw * 0.04,
        y = stw * 0.025,
        w = kMax,
        h = stw * 0.07,
  	    flags = kHAlignLeft + kVAlignCenter,
			  utf8   = true,
			  length = 20,
			  ignore = kIllegalNameChars,
      },
      SetStyle( XenonautsInvisibleTiledButtonStyle ),
      TiledButton
      {
			  name   = "vehiclecallsign",
        x = stw * 0.04,
        y = stw * 0.100,
        w = kMax,
        h = stw * 0.035,
  	    flags  = kHAlignLeft + kVAlignCenter,
			  fontScale = stw * 0.035,
		    bordersize = 1,
			  font   = AEQStatLinkFont,
			  label  = "AEQ.Rename",
			  underlined = true,
			  
        command = 
          function()
            OnChangeVehicleCallsign();
          end,
      },
    
      DottedLabel
      {
        font = AEQStatFont,
        name = "statlength",
        x = stw * 0.04,
        y = stw * 0.200,
        w = kMax - stw * 0.04,
        h = stw * 0.03,
        left = "AEQ.LENGTH",
        right = "undefined",
        fontScale = stw * 0.03,
      },
      DottedLabel
      {
        font = AEQStatFont,
        name = "statwidth",
        x = stw * 0.04,
        y = stw * 0.200 + Floor( stw * 0.042) * 1,
        w = kMax - stw * 0.04,
        h = stw * 0.03,
        left = "AEQ.WIDTH",
        right = "undefined",
        fontScale = stw * 0.03,
      },
      DottedLabel
      {
        font = AEQStatFont,
        name = "statweight",
        x = stw * 0.04,
        y = stw * 0.200 + Floor( stw * 0.042) * 2,
        w = kMax - stw * 0.04,
        h = stw * 0.03,
        left = "AEQ.WEIGHT",
        right = "undefined",
        fontScale = stw * 0.03,
      },
      DottedLabel
      {
        font = AEQStatFont,
        name = "statpower",
        x = stw * 0.04,
        y = stw * 0.200 + Floor( stw * 0.042) * 3,
        w = kMax - stw * 0.04,
        h = stw * 0.03,
        left = "AEQ.POWER",
        right = "undefined",
        fontScale = stw * 0.03,
      },
      DottedLabel
      {
        font = AEQStatFont,
        name = "statthrust",
        x = stw * 0.04,
        y = stw * 0.200 + Floor( stw * 0.042) * 4,
        w = kMax - stw * 0.04,
        h = stw * 0.03,
        left = "AEQ.THRUST",
        right = "undefined",
        fontScale = stw * 0.03,
      },

      ---------------------------

      DottedLabel
      {
        font = AEQStatFont,
        name = "fuellevel",
        x = stw * 0.04,
        y = stw * 0.200 + Floor( stw * 0.042) * 6 + Floor( stw * 0.06 ) * 0,
        w = kMax - stw * 0.04,
        h = stw * 0.04,
        left = "AEQ.FuelLevel",
        right = "undefined",
        leftcolor = BlackColor,
        dotscolor = BlackColor,
        rightcolor = BlackColor,
        fontScale = stw * 0.04,
        hidedots = true,
      },
      DottedLabel
      {
        font = AEQStatFont,
        name = "ammolevel",
        x = stw * 0.04,
        y = stw * 0.200 + Floor( stw * 0.042) * 6 + Floor( stw * 0.06 ) * 1,
        w = kMax - stw * 0.04,
        h = stw * 0.04,
        left = "AEQ.AmmoLevel",
        right = "undefined",
        leftcolor = BlackColor,
        dotscolor = BlackColor,
        rightcolor = BlackColor,
        fontScale = stw * 0.04,
        hidedots = true,
      },
      DottedLabel
      {
        font = AEQStatFont,
        name = "health",
        x = stw * 0.04,
        y = stw * 0.200 + Floor( stw * 0.042) * 6 + Floor( stw * 0.06 ) * 2,
        w = kMax - stw * 0.04,
        h = stw * 0.04,
        left = "AEQ.HealthLevel",
        right = "undefined",
        leftcolor = BlackColor,
        dotscolor = BlackColor,
        rightcolor = BlackColor,
        fontScale = stw * 0.04,
        hidedots = true,
      },
      ProgressBar
      {
        font = AEQStatFont,
        name = "fuellevelp",
        x = stw * 0.325,
        y = stw * 0.200 + Floor( stw * 0.042) * 6 + Floor( stw * 0.06 ) * 0 + stw * 0.005,
        w = kMax - stw * 0.180,
        h = stw * 0.03,
        barheight = stw * 0.0275,
        min = 1,
        max = 100,
        barcolor = pbarcolor,
        bgimage  = "uitextures/blackframe",
        barimage = "uitextures/white",
        bgtilebordersize = 4,
        percent  = false,
        fontScale = 0,
      },
      ProgressBar
      {
        font = AEQStatFont,
        name = "ammolevelp",
        x = stw * 0.325,
        y = stw * 0.200 + Floor( stw * 0.042) * 6 + Floor( stw * 0.06 ) * 1 + stw * 0.005,
        w = kMax - stw * 0.180,
        h = stw * 0.03,
        barheight = stw * 0.0275,
        min = 1,
        max = 100,
        barcolor = pbarcolor,
        bgimage  = "uitextures/blackframe",
        barimage = "uitextures/white",
        bgtilebordersize = 4,
        percent  = false,
        fontScale = 0,
      },
      ProgressBar
      {
        font = AEQStatFont,
        name = "healthp",
        x = stw * 0.325,
        y = stw * 0.200 + Floor( stw * 0.042) * 6 + Floor( stw * 0.06 ) * 2 + stw * 0.005,
        w = kMax - stw * 0.180,
        h = stw * 0.03,
        barheight = stw * 0.0275,
        min = 1,
        max = 100,
        barcolor = pbarcolor,
        bgimage  = "uitextures/blackframe",
        barimage = "uitextures/white",
        bgtilebordersize = 4,
        percent  = false,
        fontScale = 0,
      },
      
      ---------------------------

      DottedLabel
      {
        font = AEQStatFont,
        name = "statchassis",
        x = stw * 0.04,
        y = stw * 0.200 + Floor( stw * 0.042) * 6 + Floor( stw * 0.06 ) * 4,
        w = kMax - stw * 0.04,
        h = stw * 0.04,
        left = "AEQ.CHASSIS",
        right = "undefined",
        leftcolor = BlackColor,
        dotscolor = BlackColor,
        rightcolor = BlackColor,
        fontScale = stw * 0.04,
      },
      DottedLabel
      {
        font = AEQStatFont,
        name = "stathp",
        x = stw * 0.030,
        y = stw * 0.200 + Floor( stw * 0.042) * 6 + Floor( stw * 0.06 ) * 5,
        w = kMax - stw * 0.04,
        h = stw * 0.04,
        left = "AEQ.HP",
        right = "undefined",
        leftcolor = BlackColor,
        dotscolor = BlackColor,
        rightcolor = BlackColor,
        fontScale = stw * 0.04,
      },
      DottedLabel
      {
        font = AEQStatFont,
        name = "statspeed",
        x = stw * 0.04,
        y = stw * 0.200 + Floor( stw * 0.042) * 6 + Floor( stw * 0.06 ) * 6,
        w = kMax - stw * 0.04,
        h = stw * 0.04,
        left = "AEQ.SPEED",
        right = "undefined",
        leftcolor = BlackColor,
        dotscolor = BlackColor,
        rightcolor = BlackColor,
        fontScale = stw * 0.04,
      },
      DottedLabel
      {
        font = AEQStatFont,
        name = "statrange",
        x = stw * 0.04,
        y = stw * 0.200 + Floor( stw * 0.042) * 6 + Floor( stw * 0.06 ) * 7,
        w = kMax - stw * 0.04,
        h = stw * 0.04,
        left = "AEQ.RANGE",
        right = "undefined",
        leftcolor = BlackColor,
        dotscolor = BlackColor,
        rightcolor = BlackColor,
        fontScale = stw * 0.04,
      },
      DottedLabel
      {
        font = AEQStatFont,
        name = "statturnrate",
        x = stw * 0.04,
        y = stw * 0.200 + Floor( stw * 0.042) * 6 + Floor( stw * 0.06 ) * 8,
        w = kMax - stw * 0.04,
        h = stw * 0.04,
        left = "AEQ.TURNRATE",
        right = "undefined",
        leftcolor = BlackColor,
        dotscolor = BlackColor,
        rightcolor = BlackColor,
        fontScale = stw * 0.04,
      },

      DottedLabel
      {
        font = AEQStatFont,
        name = "statmissions",
        x = stw * 0.04,
        y = stw * 0.200 + Floor( stw * 0.042) * 6 + Floor( stw * 0.06 ) * 10,
        w = kMax - stw * 0.04,
        h = stw * 0.04,
        left = "AEQ.MISSIONS",
        right = "undefined",
        leftcolor = BlackColor,
        dotscolor = BlackColor,
        rightcolor = BlackColor,
        fontScale = stw * 0.04,
      },
      DottedLabel
      {
        font = AEQStatFont,
        name = "statkills",
        x = stw * 0.04,
        y = stw * 0.200 + Floor( stw * 0.042) * 6 + Floor( stw * 0.06 ) * 11,
        w = kMax - stw * 0.04,
        h = stw * 0.04,
        left = "AEQ.KILLS",
        right = "undefined",
        leftcolor = BlackColor,
        dotscolor = BlackColor,
        rightcolor = BlackColor,
        fontScale = stw * 0.04,
      },

      ---------------------------

      SetStyle( XenonautsInvisibleTiledButtonStyle ),
      TiledButton
      {
          name = "soldierdismissbutton",
          x = stw * 0.04,
          y = kMax - stw * 0.155,
          w = stw * 0.4,
          h = stw * 0.035,
  	      flags  = kHAlignLeft + kVAlignCenter,
			    fontScale = stw * 0.035,
		      bordersize = 1,
			    font   = AEQStatLinkFont,
          label = "AEQ.Decomission",
  			  underlined = true,
    	      
          command = 
            function()
              OnDecommissionVehiclePressed();
            end,
      },
      TiledButton
      {
          name = "relocatebutton",
          x = kMax - stw * 0.44,
          y = kMax - stw * 0.155,
          w = stw * 0.4,
          h = stw * 0.035,
  	      flags  = kHAlignRight + kVAlignCenter,
			    fontScale = stw * 0.035,
		      bordersize = 1,
			    font   = AEQStatLinkFont,
          label = "AEQ.Relocate",
  			  underlined = true,
    	      
          command = 
            function()            
              DoModal( "scripts/relocatedialog.lua" );
            end,
      },

      NonUniformScaledImage
      {
          x = 1,
          y = kMax - stw * 0.11,
          w = kMax - 1,
          h = 1,
          image = "uitextures/black",
          tint = Color( 0, 0, 0, 25 );
      },

      NonUniformScaledImage
      {
          x = stw / 2,
          y = kMax - stw * 0.11 + 1,
          w = 1,
          h = kMax - 1,
          image = "uitextures/black",
          tint = Color( 0, 0, 0, 25 );
      },

      SetStyle( XenonautsInvisibleTiledButtonStyle ),
      TiledButton
      {
        name = "prevsoldierbutton",
        x = 0,
        y = kMax - stw * 0.11 + 1,
        w = stw * 0.5,
        h = kMax,
        bordersize = 2,
        font = AEQSelectorFont,
        label = "AEQ.Previous",
        fontScale = stw * 0.045,
  	      
        command = 
          function()
            OnPrevVehiclePressed();
          end,
      },
      TiledButton
      {
        name = "nextsoldierbutton",
        x = stw * 0.5,
        y = kMax - stw * 0.11 + 1,
        w = kMax,
        h = kMax,
        bordersize = 2,
        font = AEQSelectorFont,
        label = "AEQ.Next",
        fontScale = stw * 0.045,
  	      
        command = 
          function()
            OnNextVehiclePressed();
          end,
      },
    },

    -------------------------------------------------------------------------------

    TiledImage
    {
	    name  = "planespanel",
      x = kMax - wsw - 8,
      y = kCenter + (hww * 0.005),
      w = wsw,
      h = wsh + 240,
      image = "ui_screens/ui_stores/speechbubble",
      bordersize = 4,
      
      BeginGroup(),
      SetStyle( CategoryButtonStyle ),

      TiledButton
      {
        name = "interceptors",
        x = wsw * 0.07,
        y = wsw * 0.07,
        w = wsw * 0.375,
        h = wsw * 0.08,
        bordersize = 4,
        font = AeqCatButtonFont,
        label = "AEQ.INTERCEPTORS",
		    fontScale = screenResolutionH * 0.014,
        overfontcolor = AeqCatOverColor,
        downfontcolor = AeqCatDownColor,
        outlineselected = true,
	      outline = 1,		
  	      
        command = 
          function()
            OnInterceptorsPressed();
          end,
      },
      TiledButton
      {
        name = "dropships",
        x = wsw * 0.55,
        y = wsw * 0.07,
        w = wsw * 0.375,
        h = wsw * 0.08,
        bordersize = 4,
        font = AeqCatButtonFont,
        label = "AEQ.DROPSHIPS",
		    fontScale = screenResolutionH * 0.014,
        overfontcolor = AeqCatOverColor,
        downfontcolor = AeqCatDownColor,
        outlineselected = true,
	      outline = 1,
		
        command = 
          function()
            OnDropshipsPressed();
          end,
      },
      ListControl
      {
        name = "airplanelist",
        x = 5,
        y = wsw * 0.20,
        w = kMax - 5,
        h = kMax - 5,
        font = MediumSoldier,

      
           TiledImage
          {
            name = "scrollbar",
            x = kMax - 7,
            y = 0,
            w = kMax,
            h = kMax,
            image = "ui_screens/ui_research/scrollbarspeech",
            bordersize = 1,

          NonUniformScaledImage
	        {
		        name  = "scrollbarBtn",
	          x = 1,
	          y = 1,
	          w = 5,
	          h = 0,
		        image = "ui_screens/ui_research/scrollbar_button",
	        },
          },
      },
    },
    
    TiledImage
    {
	    name  = "troopwindow",
      x = kCenter,
      y = kMax - trheight * 1.03,
      w = trwidth,
      h = trheight,
      image = "ui_screens/ui_stores/speechbubble",
      bordersize = 4,

      SetStyle( ScrollLeftButtonStyle ),
      TiledButton
      {
        name = "scrollleft",
        x = 0,
        y = kCenter,
        w = tsspace * 2,
        h = tsspace * 2,
        bordersize = 2,
        label = "",
        fontScale = screenScaleY,
  	      
        command = 
          function()
            ScrollTroops( true );
          end,
      },
      SetStyle( ScrollRightButtonStyle ),
      TiledButton
      {
        name = "scrollright",
        x = kMax,
        y = kCenter,
        w = tsspace * 2,
        h = tsspace * 2,
        align = kHAlignRight + kVAlignTop,
        bordersize = 2,
        label = "",
        fontScale = screenScaleY,
  	      
        command = 
          function()
            ScrollTroops( false );
          end,
      },

      TroopSlot
      {      
        name  = "boardingslot1",
        x = tsleft + ( tswidth + tsspace ) * 0,
        y = tstop,
        w = tswidth,
        h = kMax,
      },
      TroopSlot
      {      
        name  = "boardingslot2",
        x = tsleft + ( tswidth + tsspace ) * 1,
        y = tstop,
        w = tswidth,
        h = kMax,
      },
      TroopSlot
      {      
        name  = "boardingslot3",
        x = tsleft + ( tswidth + tsspace ) * 2,
        y = tstop,
        w = tswidth,
        h = kMax,
      },
      TroopSlot
      {      
        name  = "boardingslot4",
        x = tsleft + ( tswidth + tsspace ) * 3,
        y = tstop,
        w = tswidth,
        h = kMax,
      },
      TroopSlot
      {      
        name  = "boardingslot5",
        x = tsleft + ( tswidth + tsspace ) * 4,
        y = tstop,
        w = tswidth,
        h = kMax,
      },
      TroopSlot
      {      
        name  = "boardingslot6",
        x = tsleft + ( tswidth + tsspace ) * 5,
        y = tstop,
        w = tswidth,
        h = kMax,
      },
      TroopSlot
      {      
        name  = "boardingslot7",
        x = tsleft + ( tswidth + tsspace ) * 6,
        y = tstop,
        w = tswidth,
        h = kMax,
      },
      TroopSlot
      {      
        name  = "boardingslot8",
        x = tsleft + ( tswidth + tsspace ) * 7,
        y = tstop,
        w = tswidth,
        h = kMax,
      },
    }
  }
}

SetWindowVisible( "callsignedit", false );