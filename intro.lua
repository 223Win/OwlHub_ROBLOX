local mainFrame = script.Parent.mainFrame;
local infoFrame = mainFrame.infoFrame;

local newUDim2 = UDim2.new;

local targetPos = newUDim2(0, 205, 0, 40);
local defaultPos = newUDim2(1.2, 0, 1, -10);
local activePos = newUDim2(1, -10, 1, -10);
infoFrame.ChildAdded:Connect(function(child)
	mainFrame:TweenPosition(activePos, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.13, true);
	if child:IsA("TextLabel") then
		targetPos = targetPos + newUDim2(0, 0, 0, 24);
		--mainFrame:TweenSize(targetPos, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.23, true);
		mainFrame.Size = targetPos;
	end;
end);

infoFrame.ChildRemoved:Connect(function(child)
	if #infoFrame:GetChildren() == 1 then
		mainFrame:TweenPosition(defaultPos, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.13, true);
	end;
	if child:IsA("TextLabel") then
		targetPos = targetPos - newUDim2(0, 0, 0, 24);
		--mainFrame:TweenSize(targetPos, Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.23, true);
		mainFrame.Size = targetPos;
	end;
end);

local infoLabel = infoFrame.infoLabel:Clone();
infoFrame.infoLabel:Destroy();

local popup = {};

function popup:new(info)
	local infoLabel = infoLabel:Clone();
	infoLabel.Parent = infoFrame;
	infoLabel.Text = info;
	spawn(function()
		wait(1.7);
		infoLabel:Destroy();
	end);
end;

return popup;
