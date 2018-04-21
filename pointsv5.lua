local function TTTWinRoundPoints(result)
	for _,ply in pairs(player.GetAll() ) do
		local innocent = ply:GetRole() == ROLE_INNOCENT
		local detective = ply:GetRole() == ROLE_DETECTIVE
		local traitor = ply:GetRole() == ROLE_TRAITOR
		local spectator = ply:IsSpec()

		if #player.GetAll() <= 4 then 
			ply:ChatPrint("No points were given since there are less than/or 4 players on.")
		elseif #player.GetAll() >= 5 then

			if result == WIN_INNOCENT then
				if innocent or detective then
					if ply:Alive() and not spectator then
						ply:PS_GivePoints( 15 )
						ply:ChatPrint("You've been given 15 points for winning and surviving the round as an Innocent!")
					elseif not ply:Alive() then 
						ply:PS_GivePoints( 5 )
						ply:ChatPrint("Unfortunately, you're dead. You do however get 5 points since your Innocent team has won!")				
					end
				elseif spectator then return
				end
			elseif result == WIN_TRAITOR then
				if traitor then
					if ply:Alive() and not spectator then
						ply:PS_GivePoints( 30 )
						ply:ChatPrint("You've been given 30 points for winning and surviving the round as a Traitor!")
					elseif not ply:Alive() then 
						pply:PS_GivePoints( 10 )	
						ply:ChatPrint("Unfortunately, you're dead. You do however get 10 points since your Traitor team has won!")
					end
				elseif spectator then return
				end
			elseif result == WIN_TIMELIMIT then 
				if innocent or detective then
					if ply:Alive() and not spectator then
						ply:PS_GivePoints( 25 )
						ply:ChatPrint("The time has run out! What are you doing Traitors?! You're awarded 25 points for the wait.")
					elseif not ply:Alive() and not traitor then
						ply:PS_GivePoints( 15 )
						ply:ChatPrint("You're dead and you had to wait for the Traitors to do their jobs, here's 15 points for your troubles!")
					end
				elseif spectator then return
				end
			end -- Result if/else statement
		end -- #ply
	end -- Loop
end -- func
hook.Add("TTTEndRound", "WinPoints", TTTWinRoundPoints)
