function h = uiProgressBar(varargin)
%uiProgressBar: A waitbar that can be embedded in a GUI figure.

    if ishandle(varargin{1}) && size(varargin, 2) > 1
        ax = varargin{1};
        value = varargin{2};
        p = get(ax,'Child');
        x = get(p,'XData');
        x(3:4) = value;
        set(p,'XData',x)
        return
    end

    bg_color = 'w';
    fg_color = 'b';
    h = axes('Units','pixels',...
        'XLim',[0 1],'YLim',[0 1],...
        'XTick',[],'YTick',[],...
        'Color',bg_color,...
        'XColor',bg_color,'YColor',bg_color, ...
        'Parent', varargin{1});
    patch([0 0 0 0],[0 1 1 0],fg_color,...
        'Parent',h,...
        'EdgeColor','none',...
        'EraseMode','none');
end