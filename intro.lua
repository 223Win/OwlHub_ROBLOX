local mainFrame = script.Parent.mainFrame;
local infoFrame = mainFrame.infoFrame;
function CreateINFOLable()
	NewTextLabel0 = Instance.new('TextLabel')
	NewTextLabel0.Name = 'infoLabel'
	NewTextLabel0.Size = UDim2.new(1,0,0,20)
	NewTextLabel0.BackgroundColor3 = Color3.new(1, 1, 1)
	NewTextLabel0.BackgroundTransparency = 1
	NewTextLabel0.ClipsDescendants = false
	NewTextLabel0.Selectable = false
	NewTextLabel0.BorderSizePixel = 0
	NewTextLabel0.Active = false
	NewTextLabel0.Font = Enum.Font.SourceSansLight
	NewTextLabel0.RichText = false
	NewTextLabel0.Text = 'N/A'
	NewTextLabel0.TextColor3 = Color3.new(1, 1, 1)
	NewTextLabel0.TextScaled = false
	NewTextLabel0.TextSize = 18
	NewTextLabel0.TextWrapped = false
	return NewTextLabel0
end
local infoLabel = CreateINFOLable()
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
