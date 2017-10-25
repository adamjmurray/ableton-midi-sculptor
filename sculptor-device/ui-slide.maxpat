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
					"fontname" : "Arial",
					"fontsize" : 16.0,
					"id" : "obj-133",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 211.5, 194.5, 25.0, 25.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 113.674774, 85.0, 25.0, 25.0 ],
					"style" : "",
					"text" : "/",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-134",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 243.0, 198.5, 49.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 133.424774, 87.5, 39.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.menu[11]",
							"parameter_shortname" : "live.menu",
							"parameter_type" : 2,
							"parameter_enum" : [ "1", "2", "4", "8", "16", "32", "64", "128" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 2.0 ],
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "live.menu[2]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-135",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 166.450012, 194.5, 39.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 82.174774, 88.5, 35.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "velocity range[17]",
							"parameter_shortname" : "velrange",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 128.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 1.0 ],
							"parameter_unitstyle" : 0,
							"parameter_speedlim" : 5.0,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "velrange[1]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 16.0,
					"id" : "obj-130",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 211.5, 102.5, 25.0, 25.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 113.424774, 16.5, 25.0, 25.0 ],
					"style" : "",
					"text" : "/",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-131",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 238.5, 102.5, 49.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 133.424774, 20.0, 39.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.menu[10]",
							"parameter_shortname" : "live.menu",
							"parameter_type" : 2,
							"parameter_enum" : [ "1", "2", "4", "8", "16", "32", "64", "128" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 2.0 ],
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "live.menu[7]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-132",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 166.450012, 102.5, 39.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 81.924774, 20.0, 35.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "velocity range[16]",
							"parameter_shortname" : "velrange",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_mmax" : 128.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 1.0 ],
							"parameter_unitstyle" : 0,
							"parameter_speedlim" : 5.0,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "velrange[3]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-122",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 88.200012, 238.5, 73.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1.383179, 133.0, 72.0, 20.0 ],
					"style" : "",
					"text" : "randomize",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-111",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 320.325348, 275.0, 45.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 176.291595, 136.0, 41.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.menu[8]",
							"parameter_shortname" : "live.menu[5]",
							"parameter_type" : 2,
							"parameter_enum" : [ "mid", "min", "max" ],
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "live.menu[6]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-107",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 301.0, 198.5, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 175.291595, 87.5, 47.5, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.text[14]",
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
					"varname" : "live.text[9]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-98",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 301.0, 102.5, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 175.291595, 20.0, 47.5, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.text[11]",
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
					"varname" : "live.text[8]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 12.0,
					"id" : "obj-56",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 93.200012, 166.5, 49.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 7.383179, 87.5, 38.0, 20.0 ],
					"style" : "",
					"text" : "edge"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-50",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 166.450012, 134.0, 47.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 81.924774, 43.5, 34.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "velocity range[7]",
							"parameter_shortname" : "velrange",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 64.0 ],
							"parameter_unitstyle" : 0,
							"parameter_speedlim" : 5.0,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "velrange[2]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-45",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 93.200012, 198.5, 46.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 8.383179, 108.5, 55.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.menu[5]",
							"parameter_shortname" : "live.menu[5]",
							"parameter_type" : 2,
							"parameter_enum" : [ "clip", "reflect", "rotate", "-" ],
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "live.menu[3]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-42",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 93.200012, 102.5, 62.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 12.383179, 22.0, 63.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.menu[1]",
							"parameter_shortname" : "live.menu[1]",
							"parameter_type" : 2,
							"parameter_enum" : [ "start", "pitch", "velocity", "duration" ],
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "live.menu[1]"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 12.0,
					"id" : "obj-10",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 93.200012, 77.0, 42.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 12.383179, 2.0, 35.0, 20.0 ],
					"style" : "",
					"text" : "slide"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-12",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 163.0, 72.0, 42.450012, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 81.924774, 2.975006, 44.458405, 20.0 ],
					"style" : "",
					"text" : "range"
				}

			}
, 			{
				"box" : 				{
					"contdata" : 1,
					"id" : "obj-41",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 273.075348, 275.0, 33.749329, 50.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 176.291595, 154.0, 24.658417, 120.0 ],
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
					"id" : "obj-51",
					"leftvalue" : -100,
					"maxclass" : "pictslider",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 93.200012, 275.0, 82.0, 50.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 7.383179, 154.0, 120.0, 120.0 ],
					"rightvalue" : 100,
					"style" : "",
					"topvalue" : 100
				}

			}
, 			{
				"box" : 				{
					"contdata" : 1,
					"id" : "obj-63",
					"maxclass" : "multislider",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 207.125336, 275.0, 33.749329, 50.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 139.133179, 154.0, 24.5, 120.0 ],
					"slidercolor" : [ 1.0, 0.235294, 0.235294, 1.0 ],
					"style" : "",
					"thickness" : 3
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-28",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 273.075348, 244.0, 52.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 169.825012, 116.0, 53.933167, 20.0 ],
					"style" : "",
					"text" : "spread",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-27",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 213.625336, 244.0, 36.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 134.383179, 133.0, 35.0, 20.0 ],
					"style" : "",
					"text" : "shift",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-11",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 166.450012, 165.125, 47.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 82.174774, 67.5, 34.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "velocity range[5]",
							"parameter_shortname" : "velrange",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 64.0 ],
							"parameter_unitstyle" : 0,
							"parameter_speedlim" : 5.0,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "velrange"
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
			"obj-107" : [ "live.text[14]", "live.text[2]", 0 ],
			"obj-134" : [ "live.menu[11]", "live.menu", 0 ],
			"obj-111" : [ "live.menu[8]", "live.menu[5]", 0 ],
			"obj-98" : [ "live.text[11]", "live.text[2]", 0 ],
			"obj-11" : [ "velocity range[5]", "velrange", 0 ],
			"obj-132" : [ "velocity range[16]", "velrange", 0 ],
			"obj-131" : [ "live.menu[10]", "live.menu", 0 ],
			"obj-50" : [ "velocity range[7]", "velrange", 0 ],
			"obj-135" : [ "velocity range[17]", "velrange", 0 ],
			"obj-45" : [ "live.menu[5]", "live.menu[5]", 0 ],
			"obj-42" : [ "live.menu[1]", "live.menu[1]", 0 ]
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
