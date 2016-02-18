var myArgs = process.argv.slice(2);
switch (myArgs[0]) {
    case 'Hello':
        console.log("World!");
        break;
    default:
        console.log('How rude! You didn\'t even say Hello.');
}