-- This is the corrected ending for your GunLocal.lua file
-- Replace the end of your file (from around line 3062) with this:

		-- If gun is equipped, reinitialize everything
		if gun.Parent == char then
			task.wait(0.1)
			setupCharacter(char)

			-- Reinitialize UI and states
			task.spawn(function()
				task.wait(0.3) -- Wait for character to be fully ready
				if gun.Parent == char then
					updateAmmoDisplay()
					updateGunNameDisplay()
					gunGui.Enabled = true

					if isMobile then 
						mobileFrm.Visible = true 
					end

					if reticle then
						reticle.Visible = true
					end

					if isConsole and consoleHint then
						consoleHint.Visible = true
						bindGamepadControls()
					end

					-- Hide cursor when gun is equipped after respawn
					setCursorState(true)

					-- Set initial state based on ammo
					if AmmoValue.Value <= 0 and MagazinesValue.Value <= 0 then
						setState(State.NOAMMO)
					else
						setState(State.IDLE)
					end
				end
			end)
		end -- This was the missing end!
	end) -- This closes the player.CharacterAdded:Connect function

	-- Close GunCore.new function
end

-- Close GunCore module
return GunCore