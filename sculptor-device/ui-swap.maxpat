{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 7,
			"minor" : 3,
			"revision" : 4,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"rect" : [ 400.0, 206.0, 1754.0, 833.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 1,
		"gridsize" : [ 8.0, 8.0 ],
		"gridsnaponopen" : 2,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "",
		"subpatcher_template" : "",
		"boxes" : [ 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 104.0, 512.0, 69.0, 22.0 ],
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ],
					"style" : "",
					"text" : "thispatcher"
				}

			}
, 			{
				"box" : 				{
					"comment" : "",
					"id" : "obj-1",
					"index" : 0,
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 104.0, 464.0, 30.0, 30.0 ],
					"style" : ""
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-172",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 634.674072, 191.0, 39.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 75.661194, 71.5, 24.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "velocity range[11]",
							"parameter_shortname" : "velrange",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 64.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 1.0 ],
							"parameter_unitstyle" : 0,
							"parameter_speedlim" : 5.0,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "velrange[11]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 16.0,
					"id" : "obj-166",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 684.450012, 219.0, 25.0, 25.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 91.629211, 92.0, 25.0, 25.0 ],
					"style" : "",
					"text" : "/",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-167",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 707.874084, 223.0, 36.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 109.629211, 94.5, 30.968506, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.menu[15]",
							"parameter_shortname" : "live.menu",
							"parameter_type" : 2,
							"parameter_enum" : [ "1", "2", "4", "8", "16", "32", "64" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 2.0 ],
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "live.menu[10]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-168",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 634.674072, 223.0, 39.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 75.661194, 94.5, 24.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "velocity range[10]",
							"parameter_shortname" : "velrange",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 64.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 1.0 ],
							"parameter_unitstyle" : 0,
							"parameter_speedlim" : 5.0,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "velrange[10]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-169",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 758.874084, 223.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 144.067566, 94.5, 37.998413, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.text[13]",
							"parameter_shortname" : "live.text[2]",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_invisible" : 2
						}

					}
,
					"text" : "triplet",
					"texton" : "triplet",
					"varname" : "live.text[6]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-165",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 634.674072, 159.5, 46.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 75.661194, 51.5, 32.0, 20.0 ],
					"style" : "",
					"text" : "size"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-164",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 733.254272, 187.0, 43.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 144.067566, 71.5, 36.486755, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.menu[14]",
							"parameter_shortname" : "live.menu[5]",
							"parameter_type" : 2,
							"parameter_enum" : [ "first", "last", "any", "new" ],
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "live.menu[8]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-163",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 733.254272, 155.5, 54.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 144.067566, 51.5, 44.473511, 20.0 ],
					"style" : "",
					"text" : "extras"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-162",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 542.47406, 155.5, 58.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 11.748199, 51.5, 61.0, 20.0 ],
					"style" : "",
					"text" : "group"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.92549, 0.364706, 0.341176, 0.2 ],
					"activebgoncolor" : [ 0.92549, 0.364706, 0.341176, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-156",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 689.0, 322.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 184.985596, 139.0, 44.486755, 20.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.text[20]",
							"parameter_shortname" : "live.text[6]",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_invisible" : 2
						}

					}
,
					"text" : "pairs",
					"varname" : "live.text[15]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-139",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 542.47406, 180.125, 48.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 16.0, 71.5, 47.32843, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.menu[13]",
							"parameter_shortname" : "live.menu[5]",
							"parameter_type" : 2,
							"parameter_enum" : [ "notes", "time" ],
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "live.menu[9]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-129",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 535.47406, 81.5, 49.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 16.0, 3.0, 69.0, 20.0 ],
					"style" : "",
					"text" : "swap"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.92549, 0.364706, 0.341176, 0.2 ],
					"activebgoncolor" : [ 0.92549, 0.364706, 0.341176, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-110",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 697.75, 353.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 184.985596, 204.5, 44.486755, 20.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.text[16]",
							"parameter_shortname" : "live.text[6]",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_invisible" : 2
						}

					}
,
					"text" : "zip",
					"varname" : "live.text[10]"
				}

			}
, 			{
				"box" : 				{
					"contdata" : 1,
					"id" : "obj-92",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 625.200012, 292.0, 33.749329, 50.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 148.704102, 136.0, 24.0, 120.0 ],
					"slidercolor" : [ 1.0, 0.235294, 0.235294, 1.0 ],
					"style" : "",
					"thickness" : 3
				}

			}
, 			{
				"box" : 				{
					"bottomvalue" : -100,
					"color" : [ 1.0, 0.235294, 0.235294, 1.0 ],
					"elementcolor" : [ 1.0, 0.235294, 0.235294, 1.0 ],
					"id" : "obj-93",
					"leftvalue" : -100,
					"maxclass" : "pictslider",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 520.200012, 299.0, 70.5, 43.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 16.0, 136.0, 120.0, 120.0 ],
					"rightvalue" : 100,
					"style" : "",
					"topvalue" : 100
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"id" : "obj-37",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 607.949341, 268.5, 51.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 138.175537, 117.5, 47.0, 20.0 ],
					"style" : "",
					"text" : "rotate",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-64",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 597.47406, 116.5, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 70.237183, 22.975006, 50.631897, 18.049999 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.text[7]",
							"parameter_shortname" : "live.text[2]",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_invisible" : 2
						}

					}
,
					"text" : "pitch",
					"texton" : "pitch",
					"varname" : "live.text[1]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-65",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 535.47406, 116.5, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 16.0, 22.975006, 50.631897, 18.049999 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.text[8]",
							"parameter_shortname" : "live.text[2]",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_invisible" : 2
						}

					}
,
					"text" : "start",
					"texton" : "start",
					"varname" : "live.text[5]"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.92549, 0.364706, 0.341176, 0.2 ],
					"activebgoncolor" : [ 0.92549, 0.364706, 0.341176, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-44",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 689.0, 286.5, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 184.985596, 171.5, 44.486755, 20.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.text[6]",
							"parameter_shortname" : "live.text[6]",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_invisible" : 2
						}

					}
,
					"text" : "flip",
					"varname" : "live.text[4]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-43",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 714.674072, 120.0, 56.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 178.840454, 22.975006, 50.631897, 18.049999 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.text[5]",
							"parameter_shortname" : "live.text[2]",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_invisible" : 2
						}

					}
,
					"text" : "duration",
					"texton" : "duration",
					"varname" : "live.text[3]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-40",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 653.47406, 120.0, 48.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 124.603271, 22.975006, 50.631897, 18.049999 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.text[4]",
							"parameter_shortname" : "live.text[2]",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_invisible" : 2
						}

					}
,
					"text" : "velocity",
					"texton" : "velocity",
					"varname" : "live.text[2]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"id" : "obj-16",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 516.700012, 272.0, 74.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 10.053253, 117.5, 71.0, 20.0 ],
					"style" : "",
					"text" : "randomize",
					"textjustification" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-2", 0 ],
					"source" : [ "obj-1", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-167" : [ "live.menu[15]", "live.menu", 0 ],
			"obj-64" : [ "live.text[7]", "live.text[2]", 0 ],
			"obj-156" : [ "live.text[20]", "live.text[6]", 0 ],
			"obj-164" : [ "live.menu[14]", "live.menu[5]", 0 ],
			"obj-169" : [ "live.text[13]", "live.text[2]", 0 ],
			"obj-110" : [ "live.text[16]", "live.text[6]", 0 ],
			"obj-139" : [ "live.menu[13]", "live.menu[5]", 0 ],
			"obj-172" : [ "velocity range[11]", "velrange", 0 ],
			"obj-168" : [ "velocity range[10]", "velrange", 0 ],
			"obj-43" : [ "live.text[5]", "live.text[2]", 0 ],
			"obj-40" : [ "live.text[4]", "live.text[2]", 0 ],
			"obj-44" : [ "live.text[6]", "live.text[6]", 0 ],
			"obj-65" : [ "live.text[8]", "live.text[2]", 0 ]
		}
,
		"dependency_cache" : [  ],
		"autosave" : 0,
		"styles" : [ 			{
				"name" : "newobjBlue-1",
				"default" : 				{
					"accentcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjGreen-1",
				"default" : 				{
					"accentcolor" : [ 0.0, 0.533333, 0.168627, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjYellow-1",
				"default" : 				{
					"fontsize" : [ 12.059008 ],
					"accentcolor" : [ 0.82517, 0.78181, 0.059545, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
 ]
	}

}
