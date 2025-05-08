function onCreatePost()
    for i = 0, getProperty('unspawnNotes.length') - 1 do
        if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteSkins/NOTE_assets-green')
        end
    end
    for i = 0,3 do
        setPropertyFromGroup('opponentStrums', i, 'texture', 'noteSkins/NOTE_assets-green')
    end
end
