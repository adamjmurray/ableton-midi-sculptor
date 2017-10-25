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
		"rect" : [ 400.0, 206.0, 479.0, 504.0 ],
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
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-201",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 159.25, 76.0, 100.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 84.383179, 26.474976, 61.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.menu[21]",
							"parameter_shortname" : "live.menu[1]",
							"parameter_type" : 2,
							"parameter_enum" : [ "deleted", "muted" ],
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "live.menu[16]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 16.0,
					"id" : "obj-196",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 197.516846, 105.0, 25.0, 25.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 115.883179, 46.474976, 25.0, 25.0 ],
					"style" : "",
					"text" : "/",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-197",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 216.699951, 109.0, 49.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 135.883179, 49.974976, 39.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.menu[20]",
							"parameter_shortname" : "live.menu",
							"parameter_type" : 2,
							"parameter_enum" : [ "1", "2", "4", "8", "16", "32", "64", "128" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 2.0 ],
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "live.menu[15]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-198",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 165.199951, 109.0, 39.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 84.383179, 49.974976, 35.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "velocity range[24]",
							"parameter_shortname" : "velrange",
							"parameter_type" : 1,
							"parameter_mmin" : -127.0,
							"parameter_mmax" : 128.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 1.0 ],
							"parameter_unitstyle" : 0,
							"parameter_speedlim" : 5.0,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "velrange[15]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-199",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 264.449951, 109.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 183.633179, 49.974976, 47.5, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.text[23]",
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
					"varname" : "live.text[18]"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.92549, 0.364706, 0.341176, 0.2 ],
					"activebgoncolor" : [ 0.92549, 0.364706, 0.341176, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-195",
					"maxclass" : "live.text",
					"mode" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 182.516846, 247.025024, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 146.870789, 168.0, 52.233032, 20.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.text[22]",
							"parameter_shortname" : "live.text[6]",
							"parameter_type" : 2,
							"parameter_mmax" : 1.0,
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_invisible" : 2
						}

					}
,
					"text" : "apply",
					"varname" : "live.text[17]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-194",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 165.199951, 131.5, 47.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 84.383179, 72.974976, 34.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "velocity range[23]",
							"parameter_shortname" : "velrange",
							"parameter_type" : 1,
							"parameter_mmin" : 1.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 64.0 ],
							"parameter_unitstyle" : 8,
							"parameter_speedlim" : 5.0,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "velrange[14]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontname" : "Arial",
					"fontsize" : 16.0,
					"id" : "obj-188",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 211.0, 187.0, 25.0, 25.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 116.766357, 121.474976, 25.0, 25.0 ],
					"style" : "",
					"text" : "/",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-189",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 240.400024, 191.0, 49.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 136.766357, 124.974976, 39.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.menu[19]",
							"parameter_shortname" : "live.menu",
							"parameter_type" : 2,
							"parameter_enum" : [ "1", "2", "4", "8", "16", "32", "64", "128" ],
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 2.0 ],
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "live.menu[14]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-190",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 165.199951, 191.0, 39.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 85.266357, 124.974976, 35.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "velocity range[21]",
							"parameter_shortname" : "velrange",
							"parameter_type" : 1,
							"parameter_mmax" : 128.0,
							"parameter_initial_enable" : 1,
							"parameter_initial" : [ 1.0 ],
							"parameter_unitstyle" : 0,
							"parameter_speedlim" : 5.0,
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "velrange[12]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-191",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 291.400024, 187.0, 40.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 184.516357, 124.974976, 47.5, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.text[21]",
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
					"varname" : "live.text[16]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-192",
					"maxclass" : "live.numbox",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 165.199951, 159.0, 47.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 84.383179, 100.0, 34.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "velocity range[22]",
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
					"varname" : "velrange[13]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-179",
					"maxclass" : "live.menu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "float" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 64.0, 76.0, 61.0, 17.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 16.0, 26.474976, 61.0, 17.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.menu[18]",
							"parameter_shortname" : "live.menu[1]",
							"parameter_type" : 2,
							"parameter_enum" : [ "note", "start", "pitch", "velocity", "duration" ],
							"parameter_invisible" : 2
						}

					}
,
					"varname" : "live.menu[13]"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-153",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 159.25, 45.5, 65.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 84.383179, 4.474976, 40.383179, 20.0 ],
					"style" : "",
					"text" : "value",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"fontface" : 0,
					"fontsize" : 12.0,
					"id" : "obj-123",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 64.0, 231.0, 81.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 9.133179, 146.0, 73.0, 20.0 ],
					"style" : "",
					"text" : "randomize",
					"textjustification" : 1
				}

			}
, 			{
				"box" : 				{
					"bottomvalue" : -100,
					"color" : [ 1.0, 0.235294, 0.235294, 1.0 ],
					"elementcolor" : [ 1.0, 0.235294, 0.235294, 1.0 ],
					"id" : "obj-95",
					"leftvalue" : -100,
					"maxclass" : "pictslider",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 64.0, 264.0, 75.0, 44.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 16.0, 168.0, 120.0, 120.0 ],
					"rightvalue" : 100,
					"style" : "",
					"topvalue" : 100
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-9",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 75.0, 45.5, 64.0, 20.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 16.0, 4.474976, 67.5, 20.0 ],
					"style" : "",
					"text" : "set"
				}

			}
 ],
		"lines" : [  ],
		"parameters" : 		{
			"obj-197" : [ "live.menu[20]", "live.menu", 0 ],
			"obj-198" : [ "velocity range[24]", "velrange", 0 ],
			"obj-189" : [ "live.menu[19]", "live.menu", 0 ],
			"obj-190" : [ "velocity range[21]", "velrange", 0 ],
			"obj-201" : [ "live.menu[21]", "live.menu[1]", 0 ],
			"obj-191" : [ "live.text[21]", "live.text[2]", 0 ],
			"obj-192" : [ "velocity range[22]", "velrange", 0 ],
			"obj-179" : [ "live.menu[18]", "live.menu[1]", 0 ],
			"obj-199" : [ "live.text[23]", "live.text[2]", 0 ],
			"obj-195" : [ "live.text[22]", "live.text[6]", 0 ],
			"obj-194" : [ "velocity range[23]", "velrange", 0 ]
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
					"accentcolor" : [ 0.82517, 0.78181, 0.059545, 1.0 ],
					"fontsize" : [ 12.059008 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
 ]
	}

}
