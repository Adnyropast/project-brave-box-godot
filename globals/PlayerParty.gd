extends Node

const TEAM_COUNT: int = 4

var team: Array[PartyMemberVariables] = [
	PartyMemberVariables.new(preload("res://resources/party_members/pm_astrid.tres")),
	PartyMemberVariables.new(preload("res://resources/party_members/pm_panino.tres")),
	PartyMemberVariables.new(preload("res://resources/party_members/pm_quatrain.tres")),
	PartyMemberVariables.new(preload("res://resources/party_members/pm_hubert.tres")),
]
var bench: Array[PartyMemberVariables] = [
	PartyMemberVariables.new(preload("res://resources/party_members/pm_gaudi.tres")),
	PartyMemberVariables.new(preload("res://resources/party_members/pm_carmen.tres")),
	PartyMemberVariables.new(preload("res://resources/party_members/pm_moskla.tres")),
	PartyMemberVariables.new(preload("res://resources/party_members/pm_brandine.tres")),
	PartyMemberVariables.new(preload("res://resources/party_members/pm_paylla.tres")),
	PartyMemberVariables.new(preload("res://resources/party_members/pm_florence.tres")),
	PartyMemberVariables.new(preload("res://resources/party_members/pm_eyner.tres")),
	PartyMemberVariables.new(preload("res://resources/party_members/pm_nebula.tres")),
]

func switch_team_members(n1: int, n2: int):
	if(n1 < team.size() && n2 < team.size()):
		var x = team[n1]
		team[n1] = team[n2]
		team[n2] = x

func switch_bench_members(team_n: int, bench_n: int):
	if(team_n < team.size() && bench_n < bench.size()):
		var x = team[team_n]
		team[team_n] = bench[bench_n]
		bench[bench_n] = x
	elif(team_n >= team.size() && team_n < TEAM_COUNT && bench_n < bench.size()):
		team.append(bench[bench_n])
		bench.remove_at(bench_n)

func bench_team_member(n: int):
	bench.append(team[n])
	team.remove_at(n)

func get_all_members() -> Array[PartyMemberVariables]:
	return team + bench
