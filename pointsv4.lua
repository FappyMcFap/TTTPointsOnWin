local function TTTWinRoundPoints(result)
--	if result == WIN_TIMELIMIT then return end 
	if result == WIN_INNOCENT then 
		for _,ply in pairs(player.GetAll() ) do
			if (ply:GetRole() == ROLE_INNOCENT or ply:GetRole()== ROLE_DETECTIVE) then
				if ply:Alive() then
					ply:PS_GivePoints( 35 )
					ply:ChatPrint("You've been given 35 points for winning and surviving the round as an Innocent!")
				elseif not ply:Alive() then 
					ply:PS_GivePoints( 15 )
					ply:ChatPrint("Unfortunately, you're dead. You do however get 15 points since your Innocent team has won!")
				end
			elseif ply:GetRole() == TEAM_SPEC then return
			end
		end
	elseif result == WIN_TRAITOR then
		for _,ply in pairs(player.GetAll() ) do
			if ply:GetRole() == ROLE_TRAITOR then
				if ply:Alive() then
					ply:PS_GivePoints( 70 )
					ply:ChatPrint("You've been given 70 points for winning and surviving the round as a Traitor!")
				elseif not ply:Alive() then
					ply:PS_GivePoints( 20 ) 	
					ply:ChatPrint("Unfortunately, you're dead. You do however get 20 points since your Traitor team has won!")
				end
			elseif ply:GetRole() == TEAM_SPEC then return
			end
		end
	elseif result == WIN_TIMELIMIT then 
		for _,ply in pairs(player.GetAll() ) do
			if (ply:GetRole() == ROLE_INNOCENT or ply:GetRole()== ROLE_DETECTIVE) then
				if ply:Alive() then
					ply:PS_GivePoints( 50 )
					ply:ChatPrint("The time has run out! What are you doing Traitors?! You're awarded 50 points for the wait.")
				elseif not ply:Alive() then 
					ply:PS_GivePoints( 25 )
					ply:ChatPrint("You're dead and you had to wait for the Traitors to do their jobs, here's 25 points for your troubles!")
				end
			elseif ply:GetRole() == TEAM_SPEC then return
			end
		end
	end
end -- end func
hook.Add("TTTEndRound", "WinPoints", TTTWinRoundPoints)
